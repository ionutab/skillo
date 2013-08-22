package skilloo

class Candidate {

    String firstName
    String lastName
    Date birthDate
    String nationality

    Boolean driver
    Boolean sponsored
    Boolean carOwner

    String telephoneNumber
    String otherTelephoneNumber
    String email

    Consultant consultant
    Address address
    Boolean active
    Payroll payroll

    static hasMany = [candidateQualifications:CandidateQualification, candidateNotes:CandidateNote, jobs:Job, placements:Placement ]

    static constraints = {   
        consultant nullable: true
        otherTelephoneNumber nullable: true
        telephoneNumber minSize: 8

        nationality nullable: true
		/**
		 * temporary added in order to allow various tests on candidates list
		 */
		candidateNotes nullable: true
		payroll nullable: true
		candidateQualifications nullable: true
		jobs nullable: true
		placements nullable: true
        consultant nullable: true
    }
}
