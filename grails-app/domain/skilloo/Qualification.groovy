package skilloo

class Qualification {

    String code
    String name
    String description
    Boolean canBeMainTrade

    static belongsTo = CandidateQualification

    static constraints = {
        code nullable: true, unique:true, blank: false
        name unique:true, blank: false
        description nullable:true, blank: false
    }
}
