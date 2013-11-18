package skillo

import skillo.history.SkilloDomainModelWithHistory

class Candidate implements SkilloDomainModelWithHistory {

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

    static hasMany = [ candidateQualifications:CandidateQualification, candidateNotes:CandidateNote, jobs:Job, placements:Placement, candidateHistory:CandidateEvent ]

    static constraints = {
        firstName blank: false
        lastName blank: false
        nationality nullable: true, blank: false

        telephoneNumber blank: false, minSize: 8
        otherTelephoneNumber nullable: true

        candidateNotes nullable: true
        payroll nullable: true

        //temporarily added nullable false to this , althought not necessarily required because apparently there is a little bug that will not make minSize work if nullable is not SPECIFFICALLY set :D
        candidateQualifications nullable: false
        candidateQualifications minSize: 1

        jobs nullable: true
        placements nullable: true

    }

    static mapping = {
        candidateQualifications cascade: "all-delete-orphan"
    }

    def boolean checkVersion(Long version){
        if(this.version > version){
            return false
        }
        return true
    }

    void addInsertEvent() {
        def insertEvent = new CandidateEvent()
        insertEvent.candidate = this
//        insertEvent.history.consultant = this.getConsultant()
        skilloHistoryContext.insertHistory(insertEvent)
    }

    void addUpdateEvent(Consultant eventConsultant) {
    }
}
