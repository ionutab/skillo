package skillo

import grails.transaction.Transactional
import skillo.client.Client
import skillo.contact.Contact
import skillo.filters.ClientListFilter

@Transactional
class ClientController extends BaseController {

    def clientService
    def contactService
    
    def index() {
        redirect(action: "list")
    }

    def list(){
        log.info("ClientController.list")
        ClientListFilter filter = new ClientListFilter()
        if(!params.reset){
            bindData(filter,params.search)
            filter.sort=params.sort
            filter.order=params.order
        }

        def clientList = clientService.search(filter)

        def clientFirst

        if(params.id){
            clientFirst = Client.get(params.id)
        }

        if(!clientFirst){
            clientFirst = clientList != null && clientList.size() > 0 ? clientList.first() : null
        }

        [clientListFilter:filter, clientList:clientList, clientTotal: clientList.totalCount, clientInstance: clientFirst]
    }

    def fall(){
        log.info("ClientController.list")
        ClientListFilter filter = new ClientListFilter()
        if(!params.reset){
            bindData(filter,params.search)
        }

        def clientList = clientService.search(filter)

        def clientFirst

        if(params.id){
            clientFirst = Client.get(params.id)
        }

        if(!clientFirst){
            clientFirst = clientList != null && clientList.size() > 0 ? clientList.first() : null
        }

        [clientListFilter:filter, clientList:clientList, clientTotal: clientList.totalCount, clientShow: clientFirst]
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

    def display(){
        def client = Client.get(params.id)
        render(template: 'basicInformation', model:[clientInstance: client])
    }

    def displayContacts(){
        def client = Client.get(params.id)
        render(template: 'contacts', layout:'ajax', model:[clientInstance: client])
    }

    def displayContactComments(){
        def contact = Contact.get(params.id)
        render(template: 'contactComments', model:[clientContactShow: contact])
    }

    def delete(){
        log.info("ClientController.delete")
        def client = Client.get(params.id)
        if(!client){
            redirect(action:"list")
            return
        }

        clientService.delete(client.id)

        redirect(action:"list")
    }

    def show(){
        log.info("ClientController.details")
        def client = Client.get(params.id)
        if(!client){
            redirect(action:"list")
            return
        }
        ['clientInstance':client, 'newClientContact':new Contact()]
    }

    def addClientContact(){
        log.info("addClientContact")

        def client = Client.get(params.client.id)

        if(!client){
            redirect(action:"list")
            return
        }

        def newClientContact = new Contact(params.newClientContact)
        newClientContact.client = client

        contactService.save(newClientContact)
        render(view:'/contact/_contactForm', model:['clientInstance':client, 'newClientContact':newClientContact])
        return
    }

    def deleteClientContact(){
        log.info("deleteClientContact")

        def clientContact = Contact.get(params.clientContact.id)
        if(contactService.delete(clientContact)) {
            log.info("delete SUCCESSFUL")
        }

        redirect(controller: "client", action: "details", id: clientContact.client.id)
        return

    }
}
