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
    String faxNumber
    String website

    Date dateCreated
    Date lastUpdated

    static hasMany = [contacts: Contact, workSite: WorkSite, placement:Placement, clientHistory:ClientEvent]

    static constraints = {
        name unique: true, blank: false, matches: "[a-zA-Z0-9-' ]+"
        registrationNumber unique: true, blank: false, matches: "[a-zA-Z0-9- ]+"
        address nullable: true, blank: false
        telephoneNumber blank: false, nullable: true, minSize: 13, matches: "[0-9]{5}-[0-9]{3}-[0-9]{3}"
        faxNumber blank: false, nullable: true, minSize: 13, matches: "[0-9]{5}-[0-9]{3}-[0-9]{3}"
        website nullable: true, blank: false
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

    @Override
    def List<Contact> getContacts(){
        return Contact.findAllByClientAndActive(this,Boolean.TRUE)
    }
}
