package skilloo

class PayrollCompanyController {

    def scaffold = true

    def index() {
        redirect(action: "list")
    }
}
