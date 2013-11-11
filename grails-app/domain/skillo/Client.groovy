package skillo

class Client {

    String name
    String registrationNumber

    static hasMany = [contacts: Contact, workSite: WorkSite, placement:Placement]

    static constraints = {
        name unique: true, blank: false
        registrationNumber unique: true, blank: false
    }
}
