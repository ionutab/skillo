package skillo

class CandidateQualificationController {

    def scaffold = false

    def index() {
        redirect(action: "list")
    }


}
