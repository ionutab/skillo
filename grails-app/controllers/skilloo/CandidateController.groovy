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

        def availableMainTrades = Qualification.findAllByCanBeMainTrade(true)

		[candidateInstance: candidate, AvailableMainTrades: availableMainTrades]
	}

    def save() {

        def candidate = new Candidate(params["candidate"])
        def address = new Address(params["address"])
        def postCode = new PostCode(params["postCode"])

        address.postCode = PostCode.findByCode(postCode.code)
        candidate.address = address

        if(!candidate.save(deepvalidate:true, flush: true)){
            if(candidate.hasErrors()){
                candidate.errors.each {
                    println "fielderrors: " + it
                }
            }
            render(view: "create", model: [candidateInstance: candidate])
            return
        }

        def availableMainTrades = Qualification.findAllByCanBeMainTrade(true)
        flash.message = message(code: 'default.created.message', args: [message(code: 'candidate.label', default: 'Candidate'), candidate.firstName + " " + candidate.lastName])
        redirect(action: "edit", id: candidate.id, AvailableMainTrades: availableMainTrades )
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
