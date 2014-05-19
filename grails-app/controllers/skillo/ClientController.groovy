package skillo

class ClientController extends BaseController {

    def clientService
    
    def index() {
        redirect(action: "list")
    }

    def list(){
        log.info("ClientController.list")
        params.max = Math.min(params.max ? params.int('max') : 10, 100)

        def clientList = Client.createCriteria().list(params) {}

        [ClientList:clientList, ClientTotal: Client.count()]
    }

    def create(){
        log.info("ClientController.create")
        [clientInstance: new Client() ]
    }

    def save(){
        log.info("ClientController.save")

        def client = new Client(params.client)
        def address = new Address(params.address)
        def postCode = PostCode.get(params.postCode.id)

        if(postCode && address.details){
            address.postCode = postCode
            client.address = address
        } else if(postCode && !address.details){
            flash.error = "${message(code: 'default.created.message', args: [message(code: 'client.label', default: 'Client'), client.name])}"
            redirect(action: "create")
            return
        }

        if(clientService.save(client)){
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'client.label', default: 'Client'), client.name])}"
            redirect(action: "list")
        } else {
            render(view: "create", model: [clientInstance: client])
        }
    }

    def edit(){
        log.info("ClientController.edit")

        def client = Client.get(params.id)
        if(!client){
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'candidate.label', default: 'Candidate'), params.id])
            redirect(action: "list")
            return
        }

        [clientInstance: client]
    }

    def update(){

        def client = Client.get(params.id)

        if(!client){
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'client.label', default: 'Client'), params.id])
            redirect(action: "list")
            return
        }

        if(client.address){
            client.address.properties = params.address
        }

        if(params.postCode?.id && !params.postCode?.id.equals(client.address?.postCode?.id)){
            client.address?.postCode = PostCode.get(params.postCode.id)
        }

        client.properties = params.client

        if(client.version < Long.parseLong(params.version)){
            flash.message = message(code: 'default.optimistic.locking.failure', args: [message(code: 'client.label', default: '${className}'), client.id])
        }

        if(clientService.update(client)){
            flash.message = message(code: 'default.updated.message', args: [message(code: 'client.label', default: '${className}'), client.id])
        } else {
            flash.message = message(code: 'default.not.updated.message', args: [message(code: 'client.label', default: '${className}'), client.id])
        }

        redirect(action: "list")
        return
    }

    def delete(){
        log.info("ClientController.delete")
        def client = Client.get(params.id)
        if(!client){
            flash.message = message(code:'default.not.found.message', args: [message(code:'client.label', default: 'Client')])
            redirect(acion:"list")
            return
        }

        client.active = false

        if(!client.save( deepvalidate:true,flush: true )){
            flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'client.label', default: 'Client'), params.id])}"
            redirect(action: "list")
        }

        flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'client.label', default: 'Client'), params.id])}"
        redirect(action:"list")
    }

}
