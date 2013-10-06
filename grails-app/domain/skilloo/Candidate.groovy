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
    Boolean active = Boolean.TRUE
    Payroll payroll

    static hasMany = [candidateQualifications:CandidateQualification, candidateNotes:CandidateNote, jobs:Job, placements:Placement ]

    static constraints = {
        firstName blank: false
        lastName blank: false
        nationality nullable: true, blank: false

        telephoneNumber blank: false, minSize: 8
        otherTelephoneNumber nullable: true

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
