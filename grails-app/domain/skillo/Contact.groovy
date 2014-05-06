package skillo

class Contact {

    String firstName
    String lastName
    String position
    String telephoneNumber
    String email

    static belongsTo = [Client]

    static hasMany = [clientComments:ClientComment]
    
    static constraints = {
        firstName blank: false
        lastName blank: false
        position nullable: true, blank: false
        telephoneNumber nullable: true, blank: false
        email email:true, nullable: true, blank: false
    }
}
