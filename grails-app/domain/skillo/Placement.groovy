package skillo

import grails.plugin.multitenant.core.annotation.MultiTenant
import skillo.candidate.Candidate
import skillo.client.Client

@MultiTenant
class Placement {
    
    Client clientCompany
    Candidate candidate
    WorkSite workSite
    Date start
    Date end

    static constraints = {
    }
}
