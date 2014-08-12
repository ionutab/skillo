package skillo

import skillo.client.Client

class WorkSite {

    Address address
    Client clientCompany
    String details
    
    static constraints = {
        details blank: false
    }
}
