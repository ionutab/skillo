package skillo

import core.util.DocumentUtil
import grails.transaction.Transactional
import org.joda.time.DateTime
import org.joda.time.LocalDate
import org.springframework.web.multipart.commons.CommonsMultipartFile
import skillo.candidate.Candidate
import skillo.candidate.CandidateNote
import skillo.candidate.CandidateQualification
import skillo.enums.ActivityType
import skillo.filters.CandidateListSearch
import skillo.filters.CandidateMatch

class CandidateController extends BaseController {

    def candidateSearchService
    def candidateCreateService
    def candidateUpdateService
    def candidateQualificationService

    def activityService

    def index() {
        redirect(action: "list")
    }

    /**
     * action of the main list page of candidates
     * @return
     */
    def list() {
        log.info("LIST")

        //first we get from session
        CandidateListSearch filter = session["candidateSearchFilter"] != null ? session["candidateSearchFilter"] : new CandidateListSearch()

        if (!params.reset) {
            bindData(filter, params)
        } else {
            //we have to reset the filter
            filter = new CandidateListSearch()
        }

        //performing the search
        def candidateList = candidateSearchService.search(filter)

        //this candidate will be displayed in the info pane on the right
        def firstCandidate = candidateList.size() > 0 ? candidateList.first() : null

        //saving to session
        session["candidateSearchFilter"] = filter

        log.info("Rendering ${candidateList.size()} Candidates of ${candidateList.totalCount}")
        render(view: "list_split", model: [candidateListFilter: filter, candidateList: candidateList, candidateTotal: candidateList.totalCount, candidateShow: firstCandidate])
    }

    /**
     * action that leads to the create candidate page ( with new candidate initialisation )
     */
    def create() {
        log.info("create")

        //get new default candidate with initialiased boolean fields for checkboxes
        def candidate = candidateCreateService.getNewDefaultCandidate()

        def availableQualifications = Qualification.list()
        def candidateMatches = new ArrayList<Candidate>()

        [candidateInstance: candidate, CandidateMatches: candidateMatches, availableQualifications: availableQualifications as grails.converters.JSON]
    }

    /**
     * saves the new candidate
     */
    def save() {
        log.info("save")

        def candidate = new Candidate(params.candidate)
        def address = new Address(params.address)

        // we get a new candidateQualification instance with the parameter qualification
        def mainTrade = candidateQualificationService.initMainTradeByQualification(params.candidateMainTrade.id)
        def postCode = PostCode.get(params.postCode.id)

        address.postCode = postCode
        candidate.address = address

        if(mainTrade){
            candidate.addToCandidateQualifications(mainTrade)
        }

        candidate.consultant = getCurrentConsultant()

        if(candidateCreateService.save(candidate)){
            activityService.logCandidateActivity(ActivityType.CREATE, getCurrentConsultant(), candidate)
            redirect(action: "edit", id: candidate.id)
        } else {
            def availableQualifications = Qualification.findAllByCanBeMainTrade(true)
            render(view: "create", model: [candidateInstance: candidate, availableQualifications: availableQualifications as grails.converters.JSON])
        }
    }

    /**
     * this action returns the candidate from the database and redirects to the edit page
     */
    def edit() {
        log.info("edit")
        def candidate = Candidate.get(params.id)
        if (!candidate) {
            redirect(action: "list")
        }

        def availableQualifications = Qualification.findAll()
        def documentList = listDocuments()

        def newCandidateQualification = new CandidateQualification()
        newCandidateQualification.candidate = candidate

        def activities = activityService.getActivities(candidate.id)

        render(view: 'edit', model: [candidateInstance        : candidate,
                                     documentInstanceList     : documentList,
                                     candidateActivities      : activities,
                                     availableQualifications  : availableQualifications as grails.converters.JSON,
                                     newCandidateQualification: newCandidateQualification])
    }

    /**
     * this action updates the main details of a candidate - not his qualifications, payroll, or documents. etc.
     */
    def updateMainDetails() {
        log.info("updateMainDetails")

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
        }

        if (!candidateUpdateService.update(candidate)) {
            def availableQualifications = Qualification.findAll()
            def documentList = listDocuments()

            render(view: 'edit', model: [candidateInstance: candidate, documentInstanceList: documentList, availableQualifications: availableQualifications as grails.converters.JSON])
            return
        }

        activityService.logCandidateActivity(ActivityType.UPDATE, getCurrentConsultant(),candidate)
        log.info("CANDIDATE UPDATED")
        redirect(action: "edit", id: candidate.id)
    }

    /**
     * updating payment details of candidate
     */
    def updatePaymentDetails() {
        log.info("updatePaymentDetails")

        def candidate = Candidate.get(params.id)
        if (!candidate) {
            redirect(action: "list")
            return
        }

        candidate.properties = params.candidate

        if (params.payroll) {

            if (!candidate.payroll) {
                candidate.payroll = new Payroll()
            }

            bindData(candidate.payroll, params.payroll)
            log.info("PAYROLL: " + candidate.payroll)
        }

        if (!candidateUpdateService.update(candidate)) {
            def availableQualifications = Qualification.findAll()
            def documentList = listDocuments()
            render(view: 'edit', model: [candidateInstance: candidate, documentInstanceList: documentList, availableQualifications: availableQualifications as grails.converters.JSON])
            return
        }

        log.info("CANDIDATE PAYMENT DETAILS UPDATED ")
        redirect(action: "edit", id: candidate.id)
    }

    /**
     * redirects to the non-editable page of the candidate
     */
    def show() {
        def candidate = Candidate.get(params.id)
        if (!candidate) {
            redirect(action: "list")
            return
        }

        def documentList = listDocuments()
        def availableQualifications = Qualification.findAll()

        render(view: 'edit', model: [candidateInstance: candidate, documentInstanceList: documentList, availableQualifications: availableQualifications])
    }

    /**
     * makes the candidate inactive
     */
    def delete() {

        if(!params.id){
            redirect(action: "list")
        }

        if(candidateUpdateService.delete()){
            activityService.logCandidateActivity(ActivityType.DELETE, getCurrentConsultant(),candidate)
        }

        redirect(action: "list")
    }


    def documentsUpload() {

        def candidate = Candidate.get(params.id)

        List fileList = request.getFiles('files') // 'files' is the name of the input

        for (CommonsMultipartFile file : fileList) {
            if (file.empty) {
                log.info("file cannot be empty")
            } else {

                def documentInstance = new Document()
                documentInstance.type = file.getContentType()
                documentInstance.filename = file.originalFilename
                documentInstance.filedata = file.getBytes()
                documentInstance.candidateId = candidate.id
                documentInstance.fileSize = file.size
                documentInstance.humanReadableSize = DocumentUtil.bytesToHuman(file.size)

                if (!DocumentUtil.isDocumentValidForUpload(file)) {
                    documentInstance.errors.rejectValue("filedata", "type.invalid")

                    def documentList = listDocuments()
                    def availableQualifications = Qualification.findAll()

                    render(view: 'edit', model: [candidateInstance: candidate, documentInstance: documentInstance, documentInstanceList: documentList, availableQualifications: availableQualifications])
                    return
                }

                if (!documentInstance.save()) {

                    if (documentInstance.hasErrors()) {
                        documentInstance.errors.each {
                            log.info "FE" + it.fieldError.code
                        }
                    }

                    def documentList = listDocuments()
                    def availableQualifications = Qualification.findAll()

                    render(view: 'edit', model: [candidateInstance: candidate, documentInstance: documentInstance, documentInstanceList: documentList, availableQualifications: availableQualifications])
                    return
                }
            }
        }

        redirect(action: "edit", id: candidate.id)
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
                document.delete(flush: true)
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

        render(template: 'info', model: [candidateShow: candidate, newCandidateNote: newCandidateNote])
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

        redirect(action: "edit", id: candidate.id)
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
        log.info("CC.FIND POSSIBLE MATCHES")
        log.info params

        CandidateMatch filter = new CandidateMatch()
        bindData(filter, params.candidate)

        if (params.postCode && params.postCode.id) {
            filter.postCodeId = Long.parseLong(params.postCode.id)
        }

        def candidateMatches = new ArrayList<Candidate>()
        if (filter.isValid()) {
            candidateMatches = candidateSearchService.search(filter)
        }

        render(template: 'matches', model: [matchCandidates: candidateMatches])
    }

    def getEditCandidateQualification() {
        log.info("CandidateController.getEditCandidateQualification")

        def candidateQualification = CandidateQualification.get(params.id)
        render(template: 'editCandidateQualificationModal', model: [cqe: candidateQualification])
    }

    def addCandidateNote() {
        log.info("CandidateController.AddCandidateNote")

        CandidateNote newCandidateNote = new CandidateNote()
        newCandidateNote = params.newCandidateNote

        //candidate
        Candidate candidate = Candidate.get(params.candidate.id)

        //consultant
        Consultant consultant = getCurrentConsultant()

        newCandidateNote.candidate = candidate
        newCandidateNote.consultant = consultant
        newCandidateNote.note.date = new Date()

        if (!newCandidateNote.save()) {
            log.info("Failed to save note for candidate " + candidate.id + " by consultant " + consultant.id)
        }

        redirect(action: params.redirect, id: candidate.id)
    }
}