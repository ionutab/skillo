package skillo

import skillo.history.SkilloDomainModelWithHistory

class Client implements SkilloDomainModelWithHistory {

    String name
    String registrationNumber
    Address address
    Boolean active = Boolean.TRUE

    static hasMany = [contacts: Contact, workSite: WorkSite, placement:Placement, clientHistory:ClientEvent]

    static constraints = {
        name unique: true, blank: false
        registrationNumber unique: true, blank: false
        address nullable: true
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
