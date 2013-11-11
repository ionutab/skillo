package skillo

class AddressController {
    
    def scaffold = true

    def index() {
        redirect(action: "list")
    }
	
}
