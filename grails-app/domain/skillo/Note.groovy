package skillo

import grails.plugin.multitenant.core.annotation.MultiTenant

@MultiTenant
class Note {
    
    Date date
    String note
    Boolean active = Boolean.TRUE
    
    static constraints = {
        note blank: false
        note type: 'text'
    }
}
