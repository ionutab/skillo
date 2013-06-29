package skilloo

class UserTypeController {

    def scaffold = true

    def index() {
        redirect(action: "list")
    }
}
