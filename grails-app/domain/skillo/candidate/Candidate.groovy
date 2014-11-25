package skillo.candidate

import grails.plugin.multitenant.core.Tenant
import grails.plugin.multitenant.core.annotation.MultiTenant
import org.joda.time.DateTime
import org.joda.time.Years
import skillo.Address
import skillo.Consultant
import skillo.Country
import skillo.Job
import skillo.Payroll
import skillo.Placement
import skillo.history.SkilloDomainModelWithHistory

@MultiTenant
class Candidate implements SkilloDomainModelWithHistory{

    String firstName
    String lastName

    Date birthDate

    Boolean driver
    Boolean carOwner
    Boolean sponsored

    String telephoneNumber
    String otherTelephoneNumber
    String email

    Consultant consultant
    Address address
    Boolean active = Boolean.TRUE
    Payroll payroll
    Country nationality

    //next of kin details
    String nokName
    String nokTelephone
    String nokAddress
    String nokRelationship

    Date dateCreated
    Date lastUpdated

    transient Long currentVersion = 0L

    static hasMany = [candidateQualifications: CandidateQualification, candidateNotes: CandidateNote, jobs: Job, placements: Placement, candidateHistory: CandidateEvent]

    static constraints = {
        firstName blank: false, matches: "[a-zA-Z-' ]+"
        lastName blank: false, matches: "[a-zA-Z-' ]+"
        nationality nullable: true

        telephoneNumber blank: false, nullable: true, minSize: 13, matches: "[0-9]{5}-[0-9]{3}-[0-9]{3}"
        otherTelephoneNumber nullable: true

        candidateNotes nullable: true

        //temporarily added nullable false to this , althought not necessarily required because apparently there is a little bug that will not make minSize work if nullable is not SPECIFFICALLY set :D
        candidateQualifications nullable: false
        candidateQualifications minSize: 1

        jobs nullable: true
        placements nullable: true
        payroll nullable: true

        email nullable: true, blank: false, email: true

        currentVersion bindable: true

        nokName nullable: true, blank: false
        nokAddress nullable: true, blank: false
        nokTelephone nullable: true, blank: false
        nokRelationship nullable: true, blank: false

    }

    static mapping = {
        autoTimestamp true
        candidateQualifications cascade: "all-delete-orphan", sort: "expiryDate", order: "asc"

        //must see how I can order descending by the property in the embedded note class
        candidateNotes cascade: "all-delete-orphan"
        candidateHistory cascade: "all-delete-orphan"

        //index added on tenant id
        tenantId index: 'tenant_idx'
    }

    def boolean checkVersion(Long version) {
        if (this.version > version) {
            return false
        }
        return true
    }

    def Integer age() {
        if (this.birthDate == null) {
            return null
        }

        DateTime start = new DateTime(birthDate.getTime())
        DateTime end = new DateTime()

        Years years = Years.yearsBetween(start, end)

        return years.getYears()
    }

    @Override
    void addInsertEvent(Consultant consultant) {
        def insertEvent = new CandidateEvent()
        insertEvent.candidate = this
        insertEvent.consultant = this.getConsultant()
        skilloHistoryContext.insertHistory(insertEvent)
    }

    @Override
    void addInsertEvent() {
    }

    @Override
    void addUpdateEvent(Consultant eventConsultant) {

    }

    @Override
    void addUpdateEvent() {
    }

    def CandidateQualification getMainTrade() {
        for (CandidateQualification cq : candidateQualifications) {
            if (cq.isMainTrade && cq.active) {
                return cq
            }
        }
    }

    def String getFullName() {
        return firstName + " " + lastName
    }


    @Override
    public String toString() {
        return "Candidate{" +
                "id=" + id +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                '}';
    }
}
