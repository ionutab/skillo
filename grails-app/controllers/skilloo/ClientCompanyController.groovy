package skilloo

class ClientCompanyController {
    
    def scaffold = true

    def index() {
        redirect(action: "list")
    }
}
