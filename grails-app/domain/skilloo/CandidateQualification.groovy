package skilloo

class CandidateQualification {

    Qualification qualification
    Date expiryDate
    String number
    Boolean active = Boolean.TRUE
    Boolean isMainTrade

    static belongsTo = [candidate:Candidate]

    static constraints = {
        expiryDate nullable: true
        number nullable: true, blank: false
    }
    
}
