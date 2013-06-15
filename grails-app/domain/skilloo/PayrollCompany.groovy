package skilloo

class PayrollCompany {

	String companyName
	String companyDetails
	
	static belongsTo = Candidate
	
	static hasMany = [candidates:Candidate]
	
    static constraints = {
    }
}
