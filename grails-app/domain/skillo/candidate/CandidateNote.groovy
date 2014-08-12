package skillo.candidate

import skillo.Consultant
import skillo.Note

class CandidateNote {
    
    Candidate candidate
    Consultant consultant
    Note note

    static embedded = ['note']
    
    static constraints = {
    }
}
