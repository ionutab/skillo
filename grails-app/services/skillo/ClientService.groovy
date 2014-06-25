package skillo

import grails.transaction.Transactional
import org.grails.datastore.mapping.query.api.Criteria

@Transactional
class ClientService {

    def Collection<Client> list(){
        log.info("ClientService.search")
        return Client.list()
    }

    def Collection<Client> search(Client input){
        log.info("ClientService.search")
        Criteria sc = Client.createCriteria()
    }

    def boolean save(Client client){

        if(!client){
            return false
        }

        if(client.save(deepvalidate:true, flush: true)){
//            client.addInsertEvent(Consultant.findByUser(springSecurityService.getCurrentUser()))
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
