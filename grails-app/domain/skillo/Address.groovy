package skillo

import skillo.candidate.Candidate
import skillo.client.Client

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
