package skillo

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
        CandidateListSearch filter = new CandidateListSearch()
        bindData(filter, params)

        def candidateList = candidateService.search(filter)

        def firstCandidate = candidateList.size() > 0 ? candidateList.first() : null;

        log.info("Rendering ${candidateList.size()} Candidates of ${candidateList.totalCount}")
        render(view: "list_split", model: [CandidateListFilter:filter, CandidateList: candidateList, CandidateTotal: candidateList.totalCount, CandidateShow: firstCandidate])
	}

	def create() {
		def candidate = new Candidate(params)
		candidate.driver = true
		candidate.carOwner = true
        candidate.active = true

        def availableMainTrades = Qualification.findAllByCanBeMainTrade(true)

		[candidateInstance: candidate, AvailableMainTrades: availableMainTrades as grails.converters.JSON]
	}

    def save() {
        log.info("CandidateController.save")

        def candidate = new Candidate(params.candidate)
        def address = new Address(params.address)

        def mainTrade = Qualification.get(params.candidateMainTrade.id)

        if(params.postCode && params.postCode.id){
            def postCode = PostCode.get(params.postCode.id)
            if(postCode){
                address.postCode = postCode
            }
        }

        candidate.address = address

        if(mainTrade != null){

            def candidateQualification = new CandidateQualification()
            candidateQualification.qualification = mainTrade
            candidateQualification.isMainTrade = true

            candidate.addToCandidateQualifications(candidateQualification)
        }

        candidate.consultant = getCurrentConsultant()

        if(!candidate.save(deepvalidate:true, flush: true)){
            if(candidate.hasErrors()){
                candidate.errors.each {
                    println "fielderrors: " + it
                }
            }

            def availableMainTrades = Qualification.findAllByCanBeMainTrade(true)
            render(view: "create", model: [candidateInstance: candidate, AvailableMainTrades: availableMainTrades as grails.converters.JSON ])
            return
        }
//        candidate.addInsertEvent()
        flash.message = message(code: 'default.created.message', args: [message(code: 'candidate.label', default: 'Candidate'), candidate.firstName + " " + candidate.lastName])
        redirect(action: "edit", id: candidate.id )

    }

    def edit() {
        log.info("Candidate Controller - edit")

        def candidate = Candidate.get(params.id)
        if (!candidate || candidate.active == false) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'candidate.label', default: 'Candidate'), params.id])
            redirect(action: "list")
            return
        }

        def newCandidateQualification = new CandidateQualification()
        newCandidateQualification.setCandidate(candidate)

        def availableMainTrades = Qualification.findAllByCanBeMainTrade(true)
        def availableQualifications = Qualification.findAll()
        def availablePayRollCompanies = PayrollCompany.findAll()

        def documentList = listDocuments();

        [candidateInstance: candidate,documentInstanceList:documentList, newCandidateQualification: newCandidateQualification , AvailableMainTrades: availableMainTrades , AvailableQualifications: availableQualifications , AvailablePayrollCompanies: availablePayRollCompanies as grails.converters.JSON  ]
    }

    def update(){

        def candidate = Candidate.get(params.id)

        if(!candidate){
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'candidate.label', default: 'Candidate'), params.id])
            redirect(action: "list")
            return
        }

        candidate.address.properties = params.address

        if(params.postCode && params.postCode.id){
            if(!params.postCode.id.equals(candidate.address?.postCode?.id)){
                candidate.address.postCode = PostCode.get(params.postCode.id)
            }
        } else {
            candidate.address.postCode = null
        }

        candidate.payroll.properties = params.payroll
        candidate.properties = params.candidate

        if(candidate.checkVersion(Long.parseLong(params.version))){
            if (!candidate.save(deepvalidate:true )) {

                if(candidate.hasErrors()){
                    candidate.errors.each {
                        println "fielderrors: " + it
                    }
                }
                def availablePayRollCompanies = PayrollCompany.findAll()
                render(view: "edit", model: [candidateInstance: candidate , AvailablePayrollCompanies: availablePayRollCompanies as grails.converters.JSON ])
                return
            }
//            candidate.addUpdateEvent(getCurrentConsultant())
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'candidate.label', default: '${className}'), candidate.id])
        redirect(action: "list")
    }

	def show() {
		def candidate = Candidate.get(params.id)
		if (!candidate) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'candidate.label', default: 'Candidate'), params.id])
			redirect(action: "list")
			return
		}

		[candidateInstance: candidate]
	}

    def delete(){
        def candidate = Candidate.get(params.id)
        if(!candidate) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'candidate.label', default: 'Candidate'), params.id])
            redirect(action: "list")
            return
        }

//        try{
//            candidate.delete()
//        }
//        catch (DataIntegrityViolationException e) {
//            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'candidate.label', default: 'Candidate'), params.id])
//            redirect(action: "show", id: params.id)
//        }

        candidate.active = false
        if (!candidate.save(deepvalidate:true, flush: true)) {
            flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'candidate.label', default: 'Candidate'), params.id])}"
            redirect(action: "list")
        }

        flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'candidate.label', default: 'Candidate'), params.id])}"
        redirect(action: "list")

    }


    def upload() {

        List fileList = request.getFiles('files') // 'files' is the name of the input
        fileList.each { file ->
            if (file.empty) {
                flash.message = "File cannot be empty"
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

        redirect(action: "edit", id: params.candidateId )
    }

    def listDocuments(){
        def candidate = Candidate.get(params.id)
        def documentList= Document.findAll("from Document as d where d.candidateId=:candidateId", [candidateId: candidate.id])
        return documentList

    }

    def documentDownload(){
        Document documentInstance = Document.get(params.id)
        if ( documentInstance == null) {
            flash.message = "Document not found."
            redirect(action: "edit", id: params.id )
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

        print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ "+params)

        def list = params.idDocuments
        String [] ids = list.split()
        ids.each { id ->
            def  document = Document.findById(Long.valueOf(id))
            if (document) {
                document
                        .delete(flush: true)
            }

            print("#################################################### "+params)
            redirect(action: "edit", id: params.id)
        }
    }


    def display(){
        log.info("CC.DISPLAY")

        def candidate = Candidate.get(params.id)

        log.info params
        render(template: 'info', model: [CandidateShow: candidate])
    }

    def addCandidateQualification(){
        log.info("CC.ADD CANDIDATE QUALIFICATION")

        def newCandidateQualification = new CandidateQualification(params["newCandidateQualification"])

        log.info(params["newCandidateQualification"] as grails.converters.JSON)

        if (params["newCandidateQualification.expiryDate"]) {
            params["newCandidateQualification.expiryDate"] = new Date(params["newCandidateQualification.expiryDate"])
            newCandidateQualification.expiryDate = params["newCandidateQualification.expiryDate"]
        }

        if(Boolean.TRUE == newCandidateQualification.getIsMainTrade()){
            def candidateQualifications = CandidateQualification.findAllByCandidate(Candidate.get(params.get("candidate.id")))
            candidateQualifications.each { candidateQualification ->
                //put the other qualifications to not be main trade
                candidateQualification.setIsMainTrade(Boolean.FALSE)
                candidateQualification.save()
            }
        }

        newCandidateQualification.clearErrors()
        if(!newCandidateQualification.save(deepvalidate:true,flush: true)){

            newCandidateQualification.candidate = Candidate.get(newCandidateQualification.candidate.id)

        }

        redirect(action: "edit",id: newCandidateQualification.candidate.id)
    }

    def candidateMatch(){

        CandidateMatch filter = new CandidateMatch()
        bindData(filter, params)

        def candidateList = candidateService.search(filter)
        [matchCandidates: candidateList]

    }
}
