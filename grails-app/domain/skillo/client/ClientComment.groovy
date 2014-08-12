package skillo.client

import skillo.Comment
import skillo.Consultant
import skillo.Contact

class ClientComment {

    Contact contact
    Client clientCompany
    Consultant consultant
    
    Comment comment
    
    static embedded = ['comment']
    
    static constraints = {
    }
}
