package skillo

class CandidateQualificationController {

    def scaffold = true

    def index() {
        redirect(action: "list")
    }

}
