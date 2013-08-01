package skilloo

class Contact {

    String firstName
    String lastName
    String position
    String telephoneNumbers
    String email

    static hasMany = [clientComments:ClientComment]
    
    static constraints = {
        email email:true
    }
}
