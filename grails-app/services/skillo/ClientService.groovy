package skillo

import grails.transaction.Transactional
import org.grails.datastore.mapping.query.api.Criteria
import skillo.client.Client
import skillo.filters.ClientListFilter

@Transactional
class ClientService {

    def Collection<Client> search(ClientListFilter filter){
        log.info("ClientService.search")
        Criteria cc = Client.createCriteria()

        def clientList = cc.list(max:filter.max, offset:filter.offset){

            if(filter.name){
                ilike("name", new String("%$filter.name%"))
            }

            if(filter.registrationNumber){
                ilike("registrationNumber", new String("%$filter.registrationNumber%"))
            }

            eq("active", true)
        }

        return clientList
    }

    def boolean save(Client client){

        if(!client){
            return false
        }

        if(client.save(deepvalidate:true, flush: true)){
            return true
        } else {

            if(client.hasErrors()){
                client.errors.each {
                    println "fielderrors: " + it
                }
            }
            return false
        }
    }

    def boolean update(Client client){

        if (!client.save(deepvalidate:true, flush: true)) {
            if(client.hasErrors()){
                client.errors.each {
                    println "fielderrors: " + it
                }
            }
            return false
        }
//        client.addUpdateEvent(Consultant.findByUser(springSecurityService.getCurrentUser()))
        return true
    }

    def boolean delete(Long clientId){

        if(!clientId){
            return false
        }

        def client = Client.get(clientId)
        client.active = false
        return save(client)

    }

}
