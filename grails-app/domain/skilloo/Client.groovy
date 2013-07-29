package skilloo

class Client {

    String name
    String registrationNumber

    static hasMany = [contacts: Contact, workSite: WorkSite, placement:Placement]

    static constraints = { name(unique: true) }
}
