package skilloo

import java.text.DateFormat

class CandidateController {

    def scaffold = true
    def springSecurityService

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
		def candidate = new Candidate(params)
		candidate.driver = true
		candidate.carOwner = true
        candidate.active = true

        /*
        Calendar localCalendar = Calendar.getInstance(TimeZone.getDefault())
        localCalendar.set(localCalendar.get(Calendar.YEAR) - 18, 0, 1)
        candidate.birthDate = localCalendar.getTime()
        */

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


        if(params.get("mainTradeId") == null) {
            render(view: "create", model: [candidateInstance: candidate])
            return
        } else {
            Qualification mainTrade = Qualification.get(params.mainTradeId)
            CandidateQualification candidateQualification = new CandidateQualification()
            candidateQualification.setQualification(mainTrade)
            candidateQualification.setCandidate(candidate)
            candidateQualification.setActive(Boolean.TRUE)
            candidateQualification.setIsMainTrade(Boolean.TRUE)
            candidate.candidateQualifications = new ArrayList<CandidateQualification>()
            candidate.candidateQualifications.add(candidateQualification)
            println("Candidate Qualification added" )
        }

        if (!address.save(flush: true)) {
            log.debug("Address not saved" )
            render(view: "create", model: [candidateInstance: candidate])
            return
        }

        candidate.address = address
        candidate.active = Boolean.TRUE

        def user = User.get(springSecurityService.principal.id)

        if(user != null){
            def consultant = Consultant.findByUser(user)

            if(consultant == null){
                log.debug("Consultant is null")
                render(view: "create", model: [candidateInstance: candidate])
                return
            }

            candidate.consultant = consultant

        } else {
            log.debug("user is null")
        }

        if (!candidate.save(flush: true)) {
            log.debug("Candidate not saved" )
            render(view: "create", model: [candidateInstance: candidate])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'candidate.label', default: 'Candidate'), candidate.firstName + " " + candidate.lastName])
		redirect(action: "edit", id: candidate.id)
	}

    def addCandidateQualification() {

        if(params.get("candidateId") == null){
            return
        }

        def candidate = Candidate.get(Long.parseLong(params.get("candidateId").toString()))

        if(candidate == null){
            return
        }

        if(params.get("newQualificationId") == null){
            return
        }
        def qualification = Qualification.get(Long.parseLong(params.get("newQualificationId").toString()))
        if(qualification == null){
            return
        }


        def newCandidateQualification = new CandidateQualification(params)

        newCandidateQualification.setCandidate(candidate)
        newCandidateQualification.setQualification(qualification)
        newCandidateQualification.setActive(Boolean.TRUE)

        candidate.candidateQualifications.add(newCandidateQualification)

        if(Boolean.TRUE == newCandidateQualification.getIsMainTrade()){
            def candidateQualifications = CandidateQualification.findAllByCandidate(candidate)
            candidateQualifications.each { candidateQualification ->
                //put the other qualifications to not be main trade
                candidateQualification.setIsMainTrade(Boolean.FALSE)
                candidateQualification.save()
            }
        }

        if(!newCandidateQualification.save(flush: true)){
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
