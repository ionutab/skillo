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
		[Candidate: new Candidate(params)]
	}
	
	def save() {
		def candidate = new Candidate(params)
		if (!candidate.save(flush: true)) {
			render(view: "create", model: [candidate: candidate])
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

		[candidate: candidate]
	}
}
