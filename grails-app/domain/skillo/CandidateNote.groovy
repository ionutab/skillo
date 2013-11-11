package skillo

class CandidateNote {
    
    Candidate candidate
    Consultant consultant
    Note note

    static embedded = ['note']
    
    static constraints = {
    }
}
