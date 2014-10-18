package skillo.user

import grails.plugin.multitenant.core.annotation.MultiTenant

@MultiTenant
class UserType {
    
    String code
    String description

    static constraints = {
        code unique:true, blank: false
        description blank: false
    }
}
