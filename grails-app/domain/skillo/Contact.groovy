package skillo

import skillo.client.Client
import skillo.client.ClientComment

class Contact {

    String firstName
    String lastName
    String position
    String telephoneNumber
    String landlineNumber
    String email
    String role

    static belongsTo = [Client]

    static hasMany = [clientComments:ClientComment]
    
    static constraints = {
        firstName blank: false
        lastName blank: false
        position nullable: true, blank: false
        telephoneNumber nullable: true, blank: false
        landlineNumber nullable: true, blank: false
        email email:true, nullable: true, blank: false
        role nullable: true, blank: false
    }
}
