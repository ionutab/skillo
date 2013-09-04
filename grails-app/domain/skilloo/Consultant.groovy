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

        firstName blank: false
        lastName blank: false
        email blank: false

        candidateNotes nullable: true
        clientComments nullable: true
        information nullable: true
    }
}
