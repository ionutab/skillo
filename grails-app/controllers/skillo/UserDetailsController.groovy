package skillo

class UserDetailsController {

    def scaffold = true

    def index() {
        redirect(action: "list")
    }
}
