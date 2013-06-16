package skilloo

class ContactController {

    def scaffold = true

    def index() {
        redirect(action: "list")
    }
}
