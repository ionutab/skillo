package skilloo

class Candidate {

    String firstName
    String lastName
    Date birthDate
    boolean driver
    boolean sponsored
    boolean carOwner
    boolean active;

    String telephoneNumber
    String emails

    Consultant consultant
    Address address
	Qualification mainTrade;
    
    static hasMany = [candidateQualifications:CandidateQualification, candidateNotes:CandidateNote, payrolls:Payroll, jobs:Job, placements:Placement ]

    static constraints = {   
        consultant(nullable: true)
		
		/**
		 * temporary added in order to allow various tests on candidates list
		 */
		birthDate(nullable: true)
		driver(nullable: true)
		sponsored(nullable: true)
		carOwner(nullable: true)
		active(nullable: true)
		telephoneNumber(nullable: true)
		emails(nullable: true)
		address(nullable: true)
		mainTrade(nullable: true)
		candidateNotes(nullable: true)
		payrolls(nullable: true)
		candidateQualifications(nullable: true)
		jobs(nullable: true)
		placements(nullable: true)
		
        emails email:true 
    }
}
