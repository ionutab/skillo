package skillo

class ConsultantController {

    def scaffold = true

    def index() {
        redirect(action: "list")
    }
}
