package skillo

import skillo.candidate.Candidate
import skillo.client.Client


class Placement {
    
    Client clientCompany
    Candidate candidate
    WorkSite workSite
    Date start
    Date end

    static constraints = {
    }
}
