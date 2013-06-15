package skilloo

class ClientCompany {
	
	String companyName
	String companyRegistrationNumber

	static hasMany = [clientContacts: ClientContact, payrollCompanies: PayrollCompany]
	
    static constraints = {
		companyName(unique: true)
    }
}
