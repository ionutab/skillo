package skillo

class PayrollController {
    
    def scaffold = true

    def index() {
        redirect(action: "list")
    }
}
