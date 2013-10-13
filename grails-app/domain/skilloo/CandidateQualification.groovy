package skilloo

class CandidateQualification {

    Qualification qualification
    Candidate candidate
    Date expiryDate
    String number
    Boolean active
    Boolean isMainTrade

    static belongsTo = Candidate

    static constraints = {
        expiryDate nullable: true
        number nullable: true, blank: false
    }
    
}
