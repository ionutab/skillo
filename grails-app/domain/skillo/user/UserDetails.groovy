package skillo.user

import grails.plugin.multitenant.core.annotation.MultiTenant

@MultiTenant
class UserDetails {

    String firstName
    String lastName
    String telephoneNumber
    String country
    String address

    static belongsTo = [user:User]
    
    static constraints = {
        firstName blank: false
        lastName blank: false
        telephoneNumber blank: false
        country blank: false
    }
}
