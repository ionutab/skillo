package skilloo

class ClientCompany {
	
	String name
	String registrationNumber

	static hasMany = [contacts: Contact]
	
    static constraints = {
		name(unique: true)
    }
}
