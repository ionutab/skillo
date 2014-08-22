package skillo

import grails.transaction.Transactional
import skillo.contact.Contact

/**
 * Created by ionutab on 8/14/2014.
 */
@Transactional
class ContactService {

    def boolean save(Contact contact){
        if(!contact){
            return false
        }

        if(contact.save(deepvalidate:true)){
            return true
        } else {
            if(contact.hasErrors()){
                contact.errors.each {
                    println "fielderrors: " + it
                }
            }
            return false
        }
    }

    def boolean delete(Contact contact){
        if(!contact){
            return false
        }

        contact.active = false
        return contact.save()
    }

    def boolean delete(Long contactId){
        if(!contactId){
            return false
        }

        Contact contact = Contact.get(contactId)
        return delete(contact)
    }
}