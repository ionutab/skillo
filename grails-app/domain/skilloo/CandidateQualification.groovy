package skilloo

class CandidateQualification {

    Qualification qualification
    Candidate candidate
    Date expiryDate
    String number
    Boolean active
    
    static constraints = {
        number unique:true 
    }
    
}
