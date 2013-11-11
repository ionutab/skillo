package skillo

class JobController {

    def scaffold = true

    def index() {
        redirect(action: "list")
    }
}
