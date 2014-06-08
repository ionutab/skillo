package skillo

import skillo.filters.CandidateListSearch

class CandidateController extends BaseController{

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
        def postCode = PostCode.get(params.postCode.id)
        def mainTrade = Qualification.get(params.candidateMainTrade.id)

        address.postCode = postCode
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
        log.info("Candidate Controller - edit ffs")

        def candidate = Candidate.get(params.id)
        if (!candidate) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'candidate.label', default: 'Candidate'), params.id])
            redirect(action: "list")
            return
        }

        def newCandidateQualification = new CandidateQualification()
        newCandidateQualification.setCandidate(candidate)

        def availableMainTrades = Qualification.findAllByCanBeMainTrade(true)
        def availableQualifications = Qualification.findAll()
        def availablePayRollCompanies = PayrollCompany.findAll()

        [candidateInstance: candidate, newCandidateQualification: newCandidateQualification , AvailableMainTrades: availableMainTrades , AvailableQualifications: availableQualifications , AvailablePayrollCompanies: availablePayRollCompanies as grails.converters.JSON  ]
    }

    def update(){

        def candidate = Candidate.get(params.id)

        if(!candidate){
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'candidate.label', default: 'Candidate'), params.id])
            redirect(action: "list")
            return
        }

        candidate.address.properties = params.address

        if(params.postCode?.id && !params.postCode?.id.equals(candidate.address.postCode.id)){
            candidate.address.postCode = PostCode.get(params.postCode.id)
        }

        candidate.payroll.properties = params.payroll
        candidate.properties = params.candidate

        if(candidate.checkVersion(Long.parseLong(params.version))){
            if (!candidate.save(deepvalidate:true, flush: true)) {

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

        candidate.active = false
        if (!candidate.save(deepvalidate:true, flush: true)) {
            flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'candidate.label', default: 'Candidate'), params.id])}"
            redirect(action: "list")
        }

        flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'candidate.label', default: 'Candidate'), params.id])}"
        redirect(action: "list")

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

        redirect(action: "edit",id: params.candidate.id)
    }
}
