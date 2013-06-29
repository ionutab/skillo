package skilloo

class Contact {

    String firstName
    String lastName
    String position
    String telephoneNumbers
    String emails

    static hasMany = [clientComments:ClientComment]
    
    static constraints = {
        emails email:true
    }
}
