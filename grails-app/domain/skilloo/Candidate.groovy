package skilloo

class Candidate {

    String firstName
    String lastName
    Date birthDate
    boolean driver
    boolean sponsored
    boolean carOwner
    boolean active;

    String telephoneNumbers
    String emails

    Consultant consultant
    Address address
    
    static hasMany = [candidateQualifications:CandidateQualification, candidateNotes:CandidateNote, payrolls:Payroll, jobs:Job, placements:Placement ]

    static constraints = {   
        consultant(nullable: true)
        emails email:true 
    }
}
