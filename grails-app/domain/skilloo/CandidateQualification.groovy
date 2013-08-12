package skilloo

class CandidateQualification {

    Qualification qualification
    Candidate candidate
    Date expiryDate
    String number
    Boolean active
    Boolean isMainTrade
    
    static constraints = {
        expiryDate nullable: true
        number nullable: true
    }
    
}
