package skillo

class PostCodeController {

    def scaffold = true

    def index() {
        redirect(action: "list")
    }
}
