package skilloo

class QualificationController {

    def scaffold = true

    def index() {
        redirect(action: "list")
    }
}
