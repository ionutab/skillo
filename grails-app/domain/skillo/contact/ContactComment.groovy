package skillo.contact

import skillo.Consultant

class ContactComment {

    Contact contact
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
