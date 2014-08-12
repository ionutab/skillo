package skillo

import skillo.candidate.CandidateQualification

class Qualification {

    static searchable = [only: ['name']]

    String code
    String name
    String description
    Boolean canBeMainTrade = Boolean.TRUE

    static belongsTo = CandidateQualification

    static constraints = {
        code nullable: true, blank: false
        //I have set the name explicitly to nullable false as I consider it of most importance for now
        name nullable: false, unique:true, blank: false
        description nullable:true, blank: false
    }

    def boolean checkVersion(Long version){
        if(this.version > version){
            return false
        }
        return true
    }

}
