package skillo

class CandidateQualification {

    Qualification qualification
    Date expiryDate
    String number
    Boolean isMainTrade

    Boolean active = Boolean.TRUE

    static belongsTo = [candidate:Candidate]

    static constraints = {
        expiryDate nullable: true
        number nullable: true, blank: false
    }
    
}
