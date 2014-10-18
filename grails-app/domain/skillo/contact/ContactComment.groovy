package skillo.contact

import grails.plugin.multitenant.core.annotation.MultiTenant
import skillo.Consultant

@MultiTenant
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
