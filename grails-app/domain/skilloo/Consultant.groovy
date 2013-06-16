package skilloo

class Consultant {

    String extraInformation

    static hasMany = [candidateNotes:CandidateNote, clientComments:ClientComment]
    
    static constraints = {
    }
}
