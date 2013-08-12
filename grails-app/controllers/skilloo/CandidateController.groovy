package skilloo

class CandidateController {

    def scaffold = true

    def index() {
        redirect(action: "list")
    }

	def list() {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		
		def candidateList = Candidate.createCriteria().list(params){
			if(params.firstName){
				ilike("firstName", "%{params.firstName}%")
			}
		}
		
		[CandidateList: candidateList, CandidateTotal: Candidate.count()]
	}
	
	def create() {
		println "Candidate.create"
		def candidate = new Candidate(params)
		candidate.driver = true
		candidate.carOwner = true
        candidate.active = true

        def availableMainTrades = Qualification.findAllByCanBeMainTrade(true)

		[candidateInstance: candidate, AvailableMainTrades: availableMainTrades]
	}

    def edit() {
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

        [candidateInstance: candidate, newCandidateQualification: newCandidateQualification , AvailableMainTrades: availableMainTrades, AvailableQualifications: availableQualifications ]
    }
	
	def save() {
		println "Candidate.save"
		def candidate = new Candidate(params)

        if(candidate.firstName == "" || candidate.lastName == ""){
            flash.message = message(code: "candidate.form.error.nameNull")
            render(view: "create", model: [candidateInstance: candidate])
            return
        }
		
		def address = new Address();
		address.active = true

        if(params.get("addressPostCode") == ""){
            flash.message = message(code: "candidate.form.error.postCodeNull")
            render(view: "create", model: [candidateInstance: candidate])
            return
        }

        def postcode = PostCode.findByCode(params.get("addressPostCode").toString())

        if (postcode == null){
            flash.message = message(code: "candidate.form.error.postCode", args: [params.get("addressPostCode")])
            render(view: "create", model: [candidateInstance: candidate])
            return
        }

        address.details = params.get("address.details");
        address.postCode = postcode

        if(params.mainTradeId == null) {
            println "main trade qualification does not exist"
            candidate.mainTrade = null
        } else {
            Qualification mainTrade = Qualification.get(params.mainTradeId)
            CandidateQualification candidateQualification = new CandidateQualification()
            candidateQualification.setQualification(mainTrade)
            candidateQualification.setCandidate(candidate)
            candidateQualification.setActive(Boolean.TRUE)
            candidateQualification.setIsMainTrade(Boolean.TRUE)
            candidate.candidateQualifications = new ArrayList<CandidateQualification>()
            candidate.candidateQualifications.add(candidateQualification)
        }

        if (!address.save(flush: true)) {
            println "Address not saved"
            render(view: "create", model: [candidateInstance: candidate])
            return
        }

        candidate.address = address
        if (!candidate.save(flush: true)) {
            println "Candidate not saved"
            render(view: "create", model: [candidateInstance: candidate])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'candidate.label', default: 'Candidate'), candidate.id])
		redirect(action: "edit", fragment: "candidateQualificationsForm", id: candidate.id)
	}

    def addCandidateQualification() {
        println "Candidate.addCandidateQualification"
        if(params.get("candidateId") == null){
            println "candidateId IS NULL"
            return
        }

        def candidate = Candidate.get(Long.parseLong(params.get("candidateId").toString()))
        if(candidate == null){
            println "candidate IS NULL"
            return
        }

        if(params.get("newQualificationId") == null){
            println "qualification Id IS NULL"
            return
        }
        def qualification = Qualification.get(Long.parseLong(params.get("newQualificationId").toString()))
        if(qualification == null){
            println "qualifications IS NULL"
            return
        }

        def newCandidateQualification = new CandidateQualification(params)

        newCandidateQualification.setCandidate(candidate)
        newCandidateQualification.setQualification(qualification)
        newCandidateQualification.setActive(Boolean.TRUE)
        newCandidateQualification.setIsMainTrade(Boolean.FALSE)

        candidate.candidateQualifications.add(newCandidateQualification)

        if(!newCandidateQualification.save(flush: true)){
            println "Candidate Qualification not saved"
            render(view: "edit", model: [candidateInstance: candidate, newCandidateQualification: newCandidateQualification])
        }


        redirect(action: "edit", fragment: "candidateQualificationsForm", id: candidate.id)
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
}
