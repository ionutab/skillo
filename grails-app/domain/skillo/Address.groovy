package skillo

import grails.plugin.multitenant.core.annotation.MultiTenant
import skillo.candidate.Candidate
import skillo.client.Client

@MultiTenant
class Address {

    String details
    Boolean active = Boolean.TRUE
    PostCode postCode

    static belongsTo = [Candidate,WorkSite,Client]

    static constraints = {
        details blank: false
        postCode nullable: true
    }
}
