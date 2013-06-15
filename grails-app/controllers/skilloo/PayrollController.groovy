package skilloo

class PayrollController {
    
    def scaffold = true

    def index() {
        redirect(action: "list")
    }
}
