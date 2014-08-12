package skillo.client

import skillo.Address
import skillo.Consultant
import skillo.Contact
import skillo.Placement
import skillo.WorkSite
import skillo.history.SkilloDomainModelWithHistory

class Client implements SkilloDomainModelWithHistory {

    static searchable = true

    String name
    String registrationNumber
    Address address
    Boolean active = Boolean.TRUE

    String telephoneNumber

    Date dateCreated
    Date lastUpdated

    static hasMany = [contacts: Contact, workSite: WorkSite, placement:Placement, clientHistory:ClientEvent]

    static constraints = {
        name unique: true, blank: false, matches: "[a-zA-Z0-9-' ]+"
        registrationNumber unique: true, blank: false, matches: "[a-zA-Z0-9- ]+"
        address nullable: true
    }

    static mapping = {
        autoTimestamp true
        clientHistory cascade: "all-delete-orphan"
    }

    @Override
    void addInsertEvent() {
    }

    @Override
    void addInsertEvent(Consultant consultant) {
        def insertEvent = new ClientEvent()
        insertEvent.client = this

        insertEvent.consultant = consultant

        skilloHistoryContext.insertHistory(insertEvent)
    }

    @Override
    void addUpdateEvent(Consultant consultant) {
    }

    @Override
    void addUpdateEvent() {

    }
}
