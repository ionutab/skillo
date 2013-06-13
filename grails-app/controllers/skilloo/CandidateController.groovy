package skilloo

class CandidateController {

    def scaffold = true

    def index() {
        redirect(action: "list")
    }
}
