package skillo

import skillo.client.Client
import skillo.filters.ClientListFilter

class ClientController extends BaseController {

    def clientService
    
    def index() {
        redirect(action: "list")
    }

    def list(){
        log.info("ClientController.list")
        ClientListFilter filter = new ClientListFilter()
        if(!params.reset){
            bindData(filter,params.search)
        }
        def clientList = clientService.search(filter)
        [clientListFilter:filter, ClientList:clientList, ClientTotal: clientList.totalCount]
    }

    def create(){
        log.info("ClientController.create")
        [clientInstance: new Client() ]
    }

    def save(){
        log.info("ClientController.save")

        def client = new Client(params.client)
        def address = null
        def postCode = PostCode.get(params.postCode.id)

        address = new Address(params.address)
        address.postCode = postCode
        client.address = address

        if(clientService.save(client)){
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
            redirect(action: "list")
            return
        }

        if(params.address != null){
            if(client.address == null){
                client.address = new Address()
            }
            client.address.properties = params.address
        }

        client.properties = params.client
        if(client.address){
            if (params.postCode && params.postCode.id) {
                if (!params.postCode.id.equals(client.address?.postCode?.id)) {
                    client.address.postCode = PostCode.get(params.postCode.id)
                }
            } else {
                client.address.postCode = null
            }
        }

        if(clientService.update(client)){
            redirect(action: "list")
        } else {
            render(view:'edit', model: ['clientInstance':client])
        }

        return
    }

    def delete(){
        log.info("ClientController.delete")
        def client = Client.get(params.id)
        if(!client){
            redirect(action:"list")
            return
        }

        client.active = false

        if(!client.save( deepvalidate:true,flush: true )){
            redirect(action: "list")
        }

        redirect(action:"list")
    }

    def show(){
        log.info("ClientController.show")
        def client = Client.get(params.id)
        if(!client){
            redirect(action:"list")
            return
        }

        render(view:'show', model:['clientInstance':client])
    }

}
