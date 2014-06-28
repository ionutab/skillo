package skillo

class Consultant {

    String firstName
    String lastName

    String email

    String information

    User user

    String telephoneNumber
    String website
    String facebook
    String twitter

    static hasMany = [candidateNotes:CandidateNote, clientComments:ClientComment]
    
    static constraints = {
        email email: true

        firstName blank: false
        lastName blank: false
        email blank: false

        telephoneNumber blank: false, nullable: true

        website blank: false, nullable: true
        facebook blank: false, nullable: true
        twitter blank: false, nullable: true

        candidateNotes nullable: true
        clientComments nullable: true
        information nullable: true
    }
}
