package skilloo

import java.awt.GraphicsConfiguration.DefaultBufferCapabilities;

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
		[candidateInstance: candidate]
	}
	
	def save() {
		println "Candidate.save"
		def candidate = new Candidate(params)
		
		def address = new Address(params);
		address.active = true
		address.
		
		candidate.address = address
		
		if(params.mainTradeId == null) {
			println "main trade qualification does not exist"
			candidate.mainTrade = null
		}
		
		if (!address.save(flush: true)) {
			println "Address not saved"
			render(view: "create", model: [candidateInstance: candidate])
			return
		}
		
		if (!candidate.save(flush: true)) {
			println "Candidate not saved"
			render(view: "create", model: [candidateInstance: candidate])
			return
		}

		flash.message = message(code: 'default.created.message', args: [message(code: 'candidate.label', default: 'Candidate'), candidate.id])
		redirect(action: "show", id: candidate.id)
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
