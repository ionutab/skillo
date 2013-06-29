package skilloo

class UserDetails {

    String firstName
    String lastName
    String telephoneNumber
    String country
    String address

    static belongsTo = [user:User]
    
    static constraints = {
    }
}
