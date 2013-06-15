package skilloo

class Consultant {

    String extraInformation

    static hasMany = [candidateNotes:CandidateNote]
    
    static constraints = {
    }
}
