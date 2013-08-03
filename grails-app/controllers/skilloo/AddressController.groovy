package skilloo

class AddressController {
    
    def scaffold = true

    def index() {
        redirect(action: "list")
    }
	
    def save() {
        def address = new Address(params)
        if (!address.save(flush: true)) {
            render(view: "create", model: [address: address])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'address.label', default: 'Address'), address.id])
        redirect(action: "show", id: address.id)
    }
}
