package skillo

import core.util.DocumentUtil
import org.joda.time.DateTime
import org.joda.time.LocalDate
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

        def availableQualifications = Qualification.list()
        def candidateMatches = new ArrayList<Candidate>();

        [candidateInstance: candidate, CandidateMatches: candidateMatches, availableQualifications: availableQualifications as grails.converters.JSON]
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

        if (!candidate.save()) {
            if (candidate.hasErrors()) {
                candidate.errors.each {
                    println "    FE: " + it.fieldError.field
                    println "    FE: " + it.fieldError.code
                }
            }

            def availableQualifications = Qualification.findAllByCanBeMainTrade(true)
            render(view: "create", model: [candidateInstance: candidate, availableQualifications: availableQualifications as grails.converters.JSON])
            return
        }
        redirect(action: "edit", id: candidate.id)
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

        def availableQualifications = Qualification.findAll()
        def availablePayRollCompanies = PayrollCompany.findAll()
        def documentList = listDocuments();

        def newCandidateQualification = new CandidateQualification()
        newCandidateQualification.candidate = candidate

        render(view: 'edit', model: [candidateInstance: candidate,
                                     documentInstanceList: documentList,
                                     availableQualifications: availableQualifications as grails.converters.JSON,
                                     availablePayrollCompanies: availablePayRollCompanies as grails.converters.JSON],
                                     newCandidateQualification: newCandidateQualification)
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

            def availableQualifications = Qualification.findAll()
            def availablePayRollCompanies = PayrollCompany.findAll()
            def documentList = listDocuments();

            render(view: 'edit', model: [candidateInstance: candidate, documentInstanceList: documentList, availableQualifications: availableQualifications as grails.converters.JSON, availablePayrollCompanies: availablePayRollCompanies as grails.converters.JSON])
            return
        }

        log.info("CANDIDATE UPDATED ")
        redirect(action: "list")
    }

    def updatePaymentDetails() {
        log.info("CandidateController.updatePaymentDetails")

        def candidate = Candidate.get(params.id)
        candidate.properties = params.candidate

        if (!candidate) {
            redirect(action: "list")
            return
        }

        log.info params

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
            def availableQualifications = Qualification.findAll()
            def availablePayRollCompanies = PayrollCompany.findAll()
            def documentList = listDocuments();
            render(view: 'edit', model: [candidateInstance: candidate, documentInstanceList: documentList, availableQualifications: availableQualifications as grails.converters.JSON, availablePayrollCompanies: availablePayRollCompanies as grails.converters.JSON])
            return
        }

        log.info("CANDIDATE PAYMENT DETAILS UPDATED ")
        redirect(action: "list")
    }

    def show() {
        def candidate = Candidate.get(params.id)
        if (!candidate) {
            redirect(action: "list")
            return
        }
        def documentList = listDocuments();

        def availableQualifications = Qualification.findAll()
        def availablePayRollCompanies = PayrollCompany.findAll()

        render(view: 'edit', model: [candidateInstance: candidate, documentInstanceList: documentList, availableQualifications: availableQualifications, availablePayrollCompanies: availablePayRollCompanies as grails.converters.JSON])
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


    def documentsUpload() {

        List fileList = request.getFiles('files') // 'files' is the name of the input
        fileList.each { file ->
            if (file.empty) {
                log.info("file cannot be empty")
            } else {

                def candidate = Candidate.get(params.id)
                def documentInstance = new Document()
                documentInstance.type = file.getContentType()
                documentInstance.filename = file.originalFilename
                documentInstance.filedata = file.getBytes()
                documentInstance.candidateId = candidate.id
                documentInstance.fileSize = file.size
                documentInstance.humanReadableSize = DocumentUtil.bytesToHuman(file.size);
                if (!documentInstance.save()) {
                    if (documentInstance.hasErrors()) {
                        documentInstance.errors.each {
                            if (it.fieldError.code == "maxSize.exceeded") {
                                documentInstance.errors.rejectValue("filedata", "maxSize.exceeded")
                            }
                        }
                    }
                }
            }
        }

        redirect(action: "edit", id: params.id)
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

        def newCandidateNote = new CandidateNote()
        newCandidateNote.candidate = candidate

        render(template: 'info', model: [CandidateShow: candidate, newCandidateNote:newCandidateNote])
    }

    def addCandidateQualification() {
        log.info("CC.ADD CANDIDATE QUALIFICATION")

        //the new created qualification
        CandidateQualification newCandidateQualification = new CandidateQualification()
        newCandidateQualification = params.newCandidateQualification

        //candidate
        Candidate candidate = Candidate.get(params.id)
        newCandidateQualification.candidate = candidate

        if (Boolean.TRUE == newCandidateQualification.isMainTrade) {
            def candidateQualifications = CandidateQualification.findAllByCandidateAndIsMainTrade(Candidate.get(params.id), Boolean.TRUE)
            candidateQualifications.each { candidateQualification ->
                if (candidateQualification != newCandidateQualification) {
                    //put the other qualifications to not be main trade
                    candidateQualification.setIsMainTrade(Boolean.FALSE)
                    candidateQualification.save()
                }
            }
        }

        if (!newCandidateQualification.save()) {
            log.info("Failed to save qualification for candidate" + candidate.id)
//            render(template: 'createCandidateQualificationForm' ,model:[newCandidateQualification: newCandidateQualification])
//            return
        }

        redirect(action: "edit", id: params.id)
    }

    def updateCandidateQualification() {
        log.info("CandidateController.updateCandidateQualificationModal")
        CandidateQualification cqe = CandidateQualification.get(params.id)

        cqe.properties = params.editCandidateQualification

        log.info cqe.properties.toMapString()
        log.info cqe.id

        if (Boolean.TRUE.equals(cqe.isMainTrade)) {
            def candidateQualifications = CandidateQualification.findAllByCandidateAndIsMainTrade(Candidate.get(cqe.candidate.id), Boolean.TRUE)
            candidateQualifications.each { candidateQualification ->
                if (candidateQualification != cqe) {
                    //put the other qualifications to not be main trade
                    candidateQualification.setIsMainTrade(Boolean.FALSE)
                    candidateQualification.save()
                }
            }
        }

        if (!cqe.save()) {
            log.info("Failed to save qualification for candidate" + candidate.id)
        }

        redirect(action: "edit", id: cqe.candidate.id)
    }


    def deleteCandidateQualification() {
        log.info("CandidateController.DELETE")

        def candidateQualification = CandidateQualification.get(params.id)

        if (!candidateQualification) {
            redirect(controller: "candidate", action: "list")
            return
        }

        candidateQualification.active = false
        if (!candidateQualification.save(deepvalidate: true, flush: true)) {
            log.info("delete UNSUCCESSFUL")
            if (candidateQualification.hasErrors()) {
                candidateQualification.errors.each {
                    println "    FE: " + it.fieldError.field
                    println "    FE: " + it.fieldError.code
                }
            }
            redirect(controller: "candidate", action: "edit", id: candidateQualification.candidate.id)
            return
        }
        log.info("delete SUCCESSFUL")
        redirect(controller: "candidate", action: "edit", id: candidateQualification.candidate.id)
        return
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

        render(template: 'matches', model: [matchCandidates: candidateMatches])
    }

    def getEditCandidateQualification() {
        log.info("CandidateController.getEditCandidateQualification")

        def candidateQualification = CandidateQualification.get(params.id)
        render(template: 'editCandidateQualificationModal', model: [cqe: candidateQualification])
    }

    def addCandidateNote(){
        log.info("CandidateController.AddCandidateNote")
        log.info params

        CandidateNote newCandidateNote = new CandidateNote()
        newCandidateNote = params.newCandidateNote

        //candidate
        Candidate candidate = Candidate.get(params.candidate.id)
        newCandidateNote.candidate = candidate

        //consultant
        Consultant consultant = getCurrentConsultant()
        newCandidateNote.consultant = consultant

        newCandidateNote.note.date = new Date()

        if(!newCandidateNote.save()){
            log.info("Failed to save note for candidate " + candidate.id + " by consultant " + consultant.id )
        }

        redirect(action: params.redirect, id: params.id)
    }
}