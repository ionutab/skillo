package skillo.contact

import skillo.Consultant
import skillo.client.Client

class ContactComment {

    Contact contact
    Client client
    Consultant consultant

    Date date
    String comment

    Boolean active =  Boolean.TRUE

    Date dateCreated
    Date lastUpdated

    static constraints = {
        comment type: 'text', blank:false

    }

    static mapping = {
        autoTimestamp true
    }

}
