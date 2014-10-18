package skillo.user

import grails.plugin.multitenant.core.annotation.MultiTenant

@MultiTenant
class UserSetting {
    
    User user
    Setting setting
    String value

    static constraints = {
        value blank: false
    }
    
}
