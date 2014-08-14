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

@Transactional
class CandidateController extends BaseController {

    def candidateSearchService
    def candidateCreateService
    def candidateUpdateService
    def candidateQualificationService
    def candidateNoteService
    def documentService
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

        def candidateMatches = new ArrayList<Candidate>()

        [candidateInstance: candidate, CandidateMatches: candidateMatches]
    }

    /**
     * saves the new candidate
     */
    def save() {
        log.info("save")

        def candidate = new Candidate(params.candidate)
        def address = null
        def postCode = PostCode.get(params.postCode.id)
        if(params.address){
            address = new Address(params.address)
            address.postCode = postCode
            candidate.address = address
        }

        // we get a new candidateQualification instance with the parameter qualification
        if(params.candidateMainTrade.id){
            def mainTrade = candidateQualificationService.initMainTradeByQualification(Long.parseLong(params.candidateMainTrade.id))
            if(mainTrade){
                candidate.addToCandidateQualifications(mainTrade)
            }
        }

        candidate.consultant = getCurrentConsultant()

        if(candidateCreateService.save(candidate)){
            activityService.logCandidateActivity(ActivityType.CREATE, getCurrentConsultant(), candidate)
            redirect(action: "edit", id: candidate.id)
        } else {
            render(view: "create", model: [candidateInstance: candidate])
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

        def documentList = documentService.listDocuments(candidate.id)

        def newCandidateQualification = new CandidateQualification()
        newCandidateQualification.candidate = candidate

        def activities = activityService.getCandidateActivities(candidate.id)

        render(view: 'edit', model: [candidateInstance        : candidate,
                                     documentInstanceList     : documentList,
                                     candidateActivities      : activities,
                                     newCandidateQualification: newCandidateQualification,
                                     availablePayrollCompanies: PayrollCompany.list() as grails.converters.JSON])
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
        } else {
            candidate.address.postCode = null
        }

        if (!candidateUpdateService.update(candidate)) {
            def documentList = documentService.listDocuments(candidate.id)

            render(view: 'edit', model: [candidateInstance: candidate, documentInstanceList: documentList])
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
            def documentList = documentService.listDocuments(candidate.id)
            render(view: 'edit', model: [candidateInstance: candidate, documentInstanceList: documentList, availablePayrollCompanies: PayrollCompany.list() as grails.converters.JSON])
            return
        }

        activityService.logPayrollActivity(ActivityType.UPDATE, getCurrentConsultant(),candidate,candidate.payroll)

        log.info("CANDIDATE PAYMENT DETAILS UPDATED ")
        redirect(action: "edit", id: candidate.id)
    }

    /**
     * updates the details of a candidate qualification
     */
    def updateCandidateQualification() {
        log.info("updateCandidateQualificationModal")
        CandidateQualification cqe = CandidateQualification.get(params.id)
        cqe.properties = params.editCandidateQualification

        if(candidateQualificationService.update(cqe)){
            redirect(action: "edit", id: cqe.candidate.id)
            return
        }

        log.info("CANDIDATE PAYMENT DETAILS UPDATED ")
        redirect(action: "edit", id: cqe.candidate.id)

    }

    /**
     * updates the next of kin section in the candidate page
     */
    def updateNextOfKinDetails(){
        log.info("updateNextOfKinDetails")

        def candidate = Candidate.get(params.id)
        if (!candidate) {
            redirect(action: "list")
            return
        }

        if(params.nok){
            candidate.properties = params.nok
        }

        if (!candidateUpdateService.update(candidate)) {
            def documentList = documentService.listDocuments(candidate.id)
            render(view: 'edit', model: [candidateInstance: candidate, documentInstanceList: documentList, availablePayrollCompanies: PayrollCompany.list() as grails.converters.JSON])
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

        def documentList = documentService.listDocuments(candidate.id)

        def activities = activityService.getCandidateActivities(candidate.id)


        render(view: 'edit', model: [candidateInstance: candidate,
                                     documentInstanceList: documentList,
                                     candidateActivities: activities])
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

    /**
     * Action to upload a document for a candidate
     * @return
     */
    def documentsUpload() {

        def candidate = Candidate.get(params.id)

        List fileList = request.getFiles('files') // 'files' is the name of the input

        def documentInstance = documentService.uploadDocument(candidate,fileList)

        // if error was encountered wile uploading documents
        if(documentInstance!=null){

            documentInstance.errors.each {
                println "DOCUMENT fielderrors: " + it
            }

            def documentList = documentService.listDocuments(candidate.id)
            render(view: 'edit', model: [candidateInstance: candidate, documentInstance: documentInstance, documentInstanceList: documentList, availablePayrollCompanies: PayrollCompany.list() as grails.converters.JSON])
            return
        }

        redirect(action: "edit", id: candidate.id)
    }

    /**
     * Download a document for a candidate
     * @return
     */
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

    /**
     * returns the details of a candidate
     */
    def display() {
        log.info("DISPLAY")
        def candidate = Candidate.get(params.id)

        def newCandidateNote = new CandidateNote()
        newCandidateNote.candidate = candidate

        render(template: 'info', model: [candidateShow: candidate, newCandidateNote: newCandidateNote])
    }

    /**
     * adds a new candidateQualification
     */
    def addCandidateQualification() {
        log.info("add candidate qualification")

        //the new created qualification
        CandidateQualification newCandidateQualification = new CandidateQualification()
        newCandidateQualification = params.newCandidateQualification

        Long candidateId = null
        if(params.id){
            candidateId = Long.parseLong(params.id)
        }
        if (candidateQualificationService.save(newCandidateQualification, candidateId)) {
            redirect(action: "edit", id: candidateId)
        }

        log.info("Failed to save qualification for candidate" + candidateId)
    }

    /**
     * makes a candidate qualification inactive
     */
    def deleteCandidateQualification() {
        log.info("DELETE")

        if(!params.id){
            return
        }

        CandidateQualification cqDelete = CandidateQualification.get(params.id)

        if(candidateQualificationService.delete(cqDelete)) {
            log.info("delete SUCCESSFUL")
        }

        redirect(controller: "candidate", action: "edit", id: cqDelete.candidate.id)
        return

    }

    /**
     * finds candidates that are similar to the input fields
     */
    def findMatches() {
        log.info("FIND MATCHES")

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

    /**
     * returns a candidate qualification
     */
    def getEditCandidateQualification() {
        log.info("CandidateController.getEditCandidateQualification")

        def candidateQualification = CandidateQualification.get(params.id)
        render(template: 'editCandidateQualificationModal', model: [cqe: candidateQualification])
    }

    /**
     * inserts a new candidate note
     */
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

        if (candidateNoteService.save(newCandidateNote, candidate.id)){
            redirect(action: params.redirect, id: candidate.id)
            return
        }

        redirect(action: params.redirect, id: candidate.id)
    }
}