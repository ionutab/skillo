package skillo

import org.joda.time.DateTime
import org.joda.time.LocalDate
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.web.multipart.commons.CommonsMultipartFile
import skillo.filters.CandidateListSearch
import skillo.filters.CandidateMatch

class CandidateController extends BaseController {

    def candidateService

    def index() {
        redirect(action: "list")
    }

    def list() {
        //first we get from session
        CandidateListSearch filter = session["candidateSearchFilter"] != null ? session["candidateSearchFilter"] : new CandidateListSearch()

        if (!params.reset) {
            bindData(filter, params)
        } else {
            //we have to reset the filter
            filter = new CandidateListSearch()
        }

        //performing the search
        def candidateList = candidateService.search(filter)

        //this candidate will be displayed in the info pane on the right
        def firstCandidate = candidateList.size() > 0 ? candidateList.first() : null;

        //saving to session
        session["candidateSearchFilter"] = filter

        log.info("Rendering ${candidateList.size()} Candidates of ${candidateList.totalCount}")
        render(view: "list_split", model: [CandidateListFilter: filter, CandidateList: candidateList, CandidateTotal: candidateList.totalCount, CandidateShow: firstCandidate])
    }

    def create() {
        def candidate = new Candidate(params)
        candidate.driver = true
        candidate.carOwner = true
        candidate.active = true
        candidate.sponsored = true

        def availableMainTrades = Qualification.findAllByCanBeMainTrade(true)

        def candidateMatches = new ArrayList<Candidate>();

        [candidateInstance: candidate, CandidateMatches: candidateMatches, AvailableMainTrades: availableMainTrades as grails.converters.JSON]
    }

    def save() {
        log.info("CandidateController.save")

        def candidate = new Candidate(params.candidate)
        def address = new Address(params.address)

        def mainTrade = Qualification.get(params.candidateMainTrade.id)

        if (params.postCode && params.postCode.id) {
            def postCode = PostCode.get(params.postCode.id)
            if (postCode) {
                address.postCode = postCode
            }
        }

        candidate.address = address

        if (mainTrade != null) {

            def candidateQualification = new CandidateQualification()
            candidateQualification.qualification = mainTrade
            candidateQualification.isMainTrade = true
            candidate.addToCandidateQualifications(candidateQualification)
        }

        candidate.consultant = getCurrentConsultant()

        if (candidate.birthDate != null) {

            DateTime now = new LocalDate().toDateTimeAtStartOfDay()
            DateTime birthDate = new DateTime(candidate.birthDate)

            if (now.isBefore(birthDate)) {
                candidate.errors.rejectValue("birthDate", "custom.invalid.date")
            }
        }

        if (!candidate.save(deepvalidate: true, flush: true)) {
            if (candidate.hasErrors()) {
                candidate.errors.each {
                    println "    FE: " + it.fieldError.field
                    println "    FE: " + it.fieldError.code
                }
            }

            def availableMainTrades = Qualification.findAllByCanBeMainTrade(true)
            render(view: "create", model: [candidateInstance: candidate, AvailableMainTrades: availableMainTrades as grails.converters.JSON])
            return
        }
        redirect(action: "edit", id: candidate.id)
    }


    def oldEdit() {
        log.info("Candidate Controller - edit")

        def candidate = Candidate.get(params.id)
        if (!candidate) {
            redirect(action: "list")
            return
        }

        def availableMainTrades = Qualification.findAllByCanBeMainTrade(true)
        def availableQualifications = Qualification.findAll()
        def availablePayRollCompanies = PayrollCompany.findAll()
        def documentList = listDocuments();

        render(view: 'edit', model: [candidateInstance: candidate, documentInstanceList: documentList, AvailableMainTrades: availableMainTrades, AvailableQualifications: availableQualifications, availablePayrollCompanies: availablePayRollCompanies as grails.converters.JSON])
    }

    def edit() {
        log.info("Candidate Controller - edit")

        if (params.candidate) {
            log.info "CANDIDATE: " + params.candidate
        }

        def candidate = Candidate.get(params.id)
        if (!candidate) {
            redirect(action: "list")
            return
        }

        def availableMainTrades = Qualification.findAllByCanBeMainTrade(true)
        def availableQualifications = Qualification.findAll()
        def availablePayRollCompanies = PayrollCompany.findAll()
        def documentList = listDocuments();

        render(view: 'edit2', model: [candidateInstance: candidate, documentInstanceList: documentList, AvailableMainTrades: availableMainTrades, AvailableQualifications: availableQualifications, availablePayrollCompanies: availablePayRollCompanies as grails.converters.JSON])
    }

    def update() {

        def candidate = Candidate.get(params.id)

        if (!candidate) {
            redirect(action: "list")
            return
        }

        candidate.address.properties = params.address

        if (params.postCode && params.postCode.id) {
            if (!params.postCode.id.equals(candidate.address?.postCode?.id)) {
                candidate.address.postCode = PostCode.get(params.postCode.id)
            }
        } else {
            candidate.address.postCode = null
        }

        candidate.payroll.properties = params.payroll
        candidate.properties = params.candidate

        if (candidate.checkVersion(Long.parseLong(params.version))) {
            if (!candidate.save(deepvalidate: true)) {

                if (candidate.hasErrors()) {
                    candidate.errors.each {
                        println "fielderrors: " + it
                    }
                }
                def availablePayRollCompanies = PayrollCompany.findAll()
                render(view: "edit", model: [candidateInstance: candidate, AvailablePayrollCompanies: availablePayRollCompanies as grails.converters.JSON])
                return
            }
//            candidate.addUpdateEvent(getCurrentConsultant())
        }

        redirect(action: "list")
    }


    def updateMainDetails() {
        log.info("CandidateController.saveMainDetails")

        def candidate = Candidate.get(params.id)

        if (!candidate) {
            redirect(action: "list")
            return
        }

        candidate.address.properties = params.address
        candidate.properties = params.candidate

        if (params.postCode && params.postCode.id) {
            if (!params.postCode.id.equals(candidate.address?.postCode?.id)) {
                candidate.address.postCode = PostCode.get(params.postCode.id)
            }
        } else {
            candidate.address.postCode = null
        }

        if (!candidateService.update(candidate)) {
            def availableMainTrades = Qualification.findAllByCanBeMainTrade(true)
            def availableQualifications = Qualification.findAll()
            def availablePayRollCompanies = PayrollCompany.findAll()
            def documentList = listDocuments();
            render(view: 'edit2', model: [candidateInstance: candidate, documentInstanceList: documentList, AvailableMainTrades: availableMainTrades, AvailableQualifications: availableQualifications, availablePayrollCompanies: availablePayRollCompanies as grails.converters.JSON])
            return
        }

        log.info("CANDIDATE UPDATED ")
        redirect(action: "list")
    }

    def updatePaymentDetails() {
        log.info("CandidateController.savePaymentDetails")

        def candidate = Candidate.get(params.id)

        if (!candidate) {
            redirect(action: "list")
            return
        }

        log.info("PARAMS: " + params.payroll)

        if (params.payroll) {

            def payroll = candidate.payroll

            if (!payroll) {
                payroll = new Payroll()
            }
            bindData(payroll, params.payroll)

            log.info("PAYROLL: " + payroll)
            candidate.payroll = payroll
        }

        if (!candidateService.update(candidate)) {
            def availableMainTrades = Qualification.findAllByCanBeMainTrade(true)
            def availableQualifications = Qualification.findAll()
            def availablePayRollCompanies = PayrollCompany.findAll()
            def documentList = listDocuments();
            render(view: 'edit2', model: [candidateInstance: candidate, documentInstanceList: documentList, AvailableMainTrades: availableMainTrades, AvailableQualifications: availableQualifications, availablePayrollCompanies: availablePayRollCompanies as grails.converters.JSON])
            return
        }

        redirect(action: "list")
    }


    def show() {
        def candidate = Candidate.get(params.id)
        if (!candidate) {
            redirect(action: "list")
            return
        }
        def documentList = listDocuments();

        def availableMainTrades = Qualification.findAllByCanBeMainTrade(true)
        def availableQualifications = Qualification.findAll()
        def availablePayRollCompanies = PayrollCompany.findAll()


        render(view: 'edit2', model: [candidateInstance: candidate, documentInstanceList: documentList, AvailableMainTrades: availableMainTrades, AvailableQualifications: availableQualifications, availablePayrollCompanies: availablePayRollCompanies as grails.converters.JSON])
    }

    def delete() {
        def candidate = Candidate.get(params.id)
        if (!candidate) {
            redirect(action: "list")
            return
        }

        candidate.active = false
        if (!candidate.save(deepvalidate: true, flush: true)) {
            redirect(action: "list")
        }

        redirect(action: "list")
    }


    def upload() {

        List fileList = request.getFiles('files') // 'files' is the name of the input
        fileList.each { file ->
            if (file.empty) {
                log.info("file cannot be empty")
            } else {
                def candidate = Candidate.get(params.candidateId)
                def documentInstance = new Document()
                documentInstance.filename = file.originalFilename
                documentInstance.filedata = file.getBytes()
                documentInstance.candidateId = candidate.id
                documentInstance.fileSize = file.size
                documentInstance.save()
            }
        }

        redirect(action: "edit", id: params.candidateId)
    }

    def listDocuments() {
        def candidate = Candidate.get(params.id)
        def documentList = Document.findAll("from Document as d where d.candidateId=:candidateId", [candidateId: candidate.id])
        return documentList

    }

    def documentDownload() {
        Document documentInstance = Document.get(params.id)
        if (documentInstance == null) {
            redirect(action: "edit", id: params.id)
        } else {
            response.setContentType("APPLICATION/OCTET-STREAM")
            response.setHeader("Content-Disposition", "Attachment;Filename=\"${documentInstance.filename}\"")

            def outputStream = response.getOutputStream()
            outputStream << documentInstance.filedata
            outputStream.flush()
            outputStream.close()
        }
    }

    def deleteDocument() {

        print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ " + params)

        def list = params.idDocuments
        String[] ids = list.split()
        ids.each { id ->
            def document = Document.findById(Long.valueOf(id))
            if (document) {
                document
                        .delete(flush: true)
            }

            print("#################################################### " + params)
            redirect(action: "edit", id: params.id)
        }
    }


    def display() {
        log.info("CC.DISPLAY")
        def candidate = Candidate.get(params.id)
        log.info params
        render(template: 'info', model: [CandidateShow: candidate])
    }

    def addCandidateQualification() {
        log.info("CC.ADD CANDIDATE QUALIFICATION")

        //the new created qualification
        CandidateQualification newCandidateQualification = new CandidateQualification()
        newCandidateQualification = params.newCandidateQualification

        //candidate
        Candidate candidate = Candidate.get(params.id)
        newCandidateQualification.candidate = candidate

        if (Boolean.TRUE == newCandidateQualification.getIsMainTrade()) {
            def candidateQualifications = CandidateQualification.findAllByCandidate(Candidate.get(params.id))
            candidateQualifications.each { candidateQualification ->
                //put the other qualifications to not be main trade
                candidateQualification.setIsMainTrade(Boolean.FALSE)
                candidateQualification.save()
            }
        }


        if (!newCandidateQualification.save()) {
            log.info("Failed to save qualification for candidate" + candidate.id)
        }

        redirect(action: "edit", id: params.id)

    }

    def findMatches() {
        log.info("CC.FIND POSSIBLE MATCHES");
        log.info params

        CandidateMatch filter = new CandidateMatch()
        bindData(filter, params.candidate)

        if (params.postCode && params.postCode.id) {
            filter.postCodeId = Long.parseLong(params.postCode.id)
        }

        def candidateMatches = new ArrayList<Candidate>()
        if (filter.isValid()) {
            candidateMatches = candidateService.search(filter)
        }

        /*   def candidateMatches = new ArrayList<Candidate>();

           candidateMatches.add(Candidate.get(1))
           candidateMatches.add(Candidate.get(2))*/

        render(template: 'matches', model: [matchCandidates: candidateMatches])
    }


}
