package skilloo

class Consultant {

    String firstName
    String lastName
    String email
    String information

    User user

    static hasMany = [candidateNotes:CandidateNote, clientComments:ClientComment]
    
    static constraints = {
        email email: true

        candidateNotes nullable: true
        clientComments nullable: true
        information nullable: true
    }
}
