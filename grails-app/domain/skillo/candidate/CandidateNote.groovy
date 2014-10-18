package skillo.candidate

import grails.plugin.multitenant.core.annotation.MultiTenant
import skillo.Consultant
import skillo.Note

@MultiTenant
class CandidateNote {
    
    Candidate candidate
    Consultant consultant
    Note note

    static embedded = ['note']
    
    static constraints = {
    }
}
