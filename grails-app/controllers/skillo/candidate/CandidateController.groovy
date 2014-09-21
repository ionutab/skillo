package skillo.candidate

import grails.transaction.Transactional
import skillo.Address
import skillo.BaseController
import skillo.Consultant
import skillo.Document
import skillo.Payroll
import skillo.PayrollCompany
import skillo.PostCode
import skillo.enums.ActivityType
import skillo.enums.Operation
import skillo.enums.SearchOperator
import skillo.filters.CandidateListFilter
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
        CandidateListFilter filter = session["candidateSearchFilter"] != null ? session["candidateSearchFilter"] : new CandidateListFilter()

        if (!params.reset) {
            bindData(filter, params)
        } else {
            //we have to reset the filter
            filter = new CandidateListFilter()
        }

        //performing the search
        def candidateList = candidateSearchService.search(filter)

        //this candidate will be displayed in the info pane on the right
        def firstCandidate

        if(params.id){
            if(((String)params.id).isNumber()){
                firstCandidate = Candidate.findByIdAndActive(params.id,true)
            }
        }

        if(!firstCandidate){
            firstCandidate = candidateList.size() > 0 ? candidateList.first() : null
        }

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
        def activities = activityService.getCandidateActivities(Long.valueOf(candidate.id))

        render(view: 'edit', model: [candidateInstance        : candidate,
                                     documentInstanceList     : documentList,
                                     newCandidateQualification: newCandidateQualification,
                                     candidateActivities: activities,
                                     activityInstanceTotal:activities.size(),
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
            def activities = activityService.getCandidateActivities(Long.valueOf(candidate.id))
            render(view: 'edit', model: [candidateInstance: candidate, documentInstanceList: documentList, activityInstanceTotal:activities.size()])
            return
        }

        activityService.logCandidateActivity(ActivityType.UPDATE, getCurrentConsultant(),candidate)
        log.info("CANDIDATE UPDATED")
        redirect(action: "edit", id: candidate.id,candidateInstance: candidate)
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

        activityService.logCandidateActivity(ActivityType.UPDATE, getCurrentConsultant(),candidate)

        log.info("CANDIDATE PAYMENT DETAILS UPDATED ")
        redirect(action: "edit", id: candidate.id,candidateInstance: candidate)
    }

    /**
     * updates the details of a candidate qualification
     */
    def updateCandidateQualification() {
        log.info("updateCandidateQualificationModal")
        CandidateQualification cqe = CandidateQualification.get(params.id)
        cqe.properties = params.editCandidateQualification


        if(candidateQualificationService.update(cqe)){
            activityService.logCandidateQualificationActivity(ActivityType.UPDATE,getCurrentConsultant(),cqe.candidate,cqe, Operation.UPDATE)
            redirect(action: "edit", id: cqe.candidate.id,candidateInstance: cqe.candidate)
            return
        }

        log.info("CANDIDATE PAYMENT DETAILS UPDATED ")
        redirect(action: "edit", id: cqe.candidate.id,candidateInstance: cqe.candidate)

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
            log.info("NOT UPDATED NEXT OF KIN");
            def documentList = documentService.listDocuments(candidate.id)
            render(view: 'edit', model: [candidateInstance: candidate, documentInstanceList: documentList, availablePayrollCompanies: PayrollCompany.list() as grails.converters.JSON])
            return
        }

        activityService.logCandidateActivity(ActivityType.UPDATE,getCurrentConsultant(),candidate)
        log.info("CANDIDATE PAYMENT DETAILS UPDATED ")
        redirect(action: "edit", id: candidate.id,candidateInstance: candidate)

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
                                     activityInstanceTotal:activities.size(),
                                     candidateActivities: activities])
    }

    /**
     * makes the candidate inactive
     */
    def delete() {

        if(!params.id){
            redirect(action: "list")
        }


        if(candidateUpdateService.delete(params.id)){
            Candidate candidate = Candidate.get(params.id)
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

        List<String> uploadedDocuments = new ArrayList<>()
        def documentInstance = documentService.uploadDocument(candidate,fileList,uploadedDocuments)

        // if error was encountered wile uploading documents
        if(documentInstance!=null){

            documentInstance.errors.each {
                println "DOCUMENT fielderrors: " + it
            }

            def documentList = documentService.listDocuments(candidate.id)
            render(view: 'edit', model: [candidateInstance: candidate, documentInstance: documentInstance, documentInstanceList: documentList, availablePayrollCompanies: PayrollCompany.list() as grails.converters.JSON])
            return
        }

        activityService.logDocumentsActivity(ActivityType.UPDATE,getCurrentConsultant(),candidate,uploadedDocuments)

        redirect(action: "edit", id: candidate.id,candidateInstance: candidate)
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
        def candidate = Candidate.get(params.id)

        def newCandidateNote = new CandidateNote()
        newCandidateNote.candidate = candidate

        render(template: 'info', layout: 'ajax', model: [candidateShow: candidate, newCandidateNote: newCandidateNote])
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
            activityService.logCandidateQualificationActivity(ActivityType.UPDATE,getCurrentConsultant(),newCandidateQualification.candidate,newCandidateQualification, Operation.ADD)
            redirect(action: "edit", id: candidateId,candidateInstance: newCandidateQualification.candidate)
            return
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
            activityService.logCandidateQualificationActivity(ActivityType.UPDATE,getCurrentConsultant(),cqDelete.candidate,cqDelete, Operation.DELETE)
            log.info("delete SUCCESSFUL")
        }

        redirect(controller: "candidate", action: "edit", id: cqDelete.candidate.id,candidateInstance: cqDelete.candidate)
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

        if (candidateNoteService.save(newCandidateNote)){
            redirect(action: params.redirect, id: candidate.id)
            return
        }

        redirect(action: params.redirect, id: candidate.id,candidateInstance: candidate)
    }

    /**
     * method used to search a candidate using multiple criteria
     * @return
     */
    def advancedSearch(){
        log.info("CandidateController.advancedSearch")

        Long q1Id = null
        if(params.qualification1){
            q1Id = Long.valueOf(params.qualification1)
        }

        Long q2Id = null
        if(params.qualification2){
            q2Id = Long.valueOf(params.qualification2)
        }

        Long q3Id = null
        if(params.qualification3){
            q3Id = Long.valueOf(params.qualification3)
        }

        Long q4Id = null
        if(params.qualification4){
            q4Id = Long.valueOf(params.qualification4)
        }

        String searchPostCode = null
        if(params.postcode1){
            searchPostCode=params.postcode1
        }

        //performing the search
        def candidateList = candidateSearchService.advancedSearch(q1Id,q2Id,q3Id,q4Id,searchPostCode)


        //this candidate will be displayed in the info pane on the right
        def firstCandidate = candidateList.size() > 0 ? candidateList.first() : null


        def searchOperators = SearchOperator.values()

        render(view: "list_split", model: [candidateList: candidateList, candidateShow: firstCandidate, candidateTotal: candidateList.size(), operators:searchOperators])
    }

    def filter ={
        params.max = Math.min(params.max ? params.int('max') : 3, 100)
        def activities = activityService.getCandidateActivities(Long.valueOf(params.id))
        render(template: '/home/template/latestActivities', model: [candidateActivities: activities, activityInstanceTotal:activities.size()])
    }


}