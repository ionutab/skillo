package skillo.user

import grails.plugin.multitenant.core.annotation.MultiTenant

@MultiTenant
class Setting {
    
    String code
    String defaultValue

    static constraints = {
        code unique:true, blank: false
        defaultValue blank: false
    }
}