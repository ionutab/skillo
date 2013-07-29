package skilloo

class CandidateController {

    def scaffold = true

    def index() {
        redirect(action: "list")
    }

	def list() {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[CandidateList: Candidate.list(params), CandidateTotal: Candidate.count()]
	}
}
