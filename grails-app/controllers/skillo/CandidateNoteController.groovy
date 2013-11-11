package skillo

class CandidateNoteController {

	def scaffold = true

    def index() {
        redirect(action: "list")
    }
}
