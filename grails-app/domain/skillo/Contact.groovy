package skillo

import skillo.client.Client
import skillo.client.ClientComment

class Contact {

    String firstName
    String lastName
    String role
    String telephoneNumber
    String landlineNumber
    String email

    Boolean active = Boolean.TRUE

    Date dateCreated
    Date lastUpdated

    static belongsTo = [client:Client]

    static hasMany = [clientComments:ClientComment]
    
    static constraints = {
        firstName blank: false, matches: "[a-zA-Z-' ]+"
        lastName blank: false, matches: "[a-zA-Z-' ]+"
        role nullable: true, blank: false
        telephoneNumber blank: false, nullable: true, minSize: 13, matches: "[0-9]{5}-[0-9]{3}-[0-9]{3}"
        landlineNumber nullable: true, blank: false, minSize: 13, matches: "[0-9]{5}-[0-9]{3}-[0-9]{3}"
        email email:true, nullable: true, blank: false
    }

    static mapping = {
        autoTimestamp true
    }

    def String getFullName(){
        return firstName + " " + lastName
    }
}
