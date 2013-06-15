package skilloo

class Qualification {

	String qualificationCode
	String qualificationName
	String qualificationDescription
	
	
    static constraints = {
		qualificationCode unique:true
		qualificationName unique:true
    }
}
