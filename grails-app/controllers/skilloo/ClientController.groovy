package skilloo

class ClientController {
    
    def scaffold = true

    def index() {
        redirect(action: "list")
    }
}
