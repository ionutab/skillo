package skillo

import grails.plugin.multitenant.core.annotation.MultiTenant
import skillo.client.Client

@MultiTenant
class WorkSite {

    Address address
    Client clientCompany
    String details
    
    static constraints = {
        details blank: false
    }
}
