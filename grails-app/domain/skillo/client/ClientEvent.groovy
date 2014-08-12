package skillo.client

import skillo.Consultant
import skillo.history.DefaultHistoryEvent
import skillo.history.DomainModelEvent

class ClientEvent implements DomainModelEvent {

    Consultant consultant
    Client client
    DefaultHistoryEvent eventDetails = new DefaultHistoryEvent()

    static embedded = ['eventDetails']

    static constraints = {

    }

    @Override
    void setEventDetails(String eventDetails) {
        this.eventDetails.setDetails(eventDetails)
    }

    @Override
    void setEventDetails(DefaultHistoryEvent eventDetails) {
        this.eventDetails = eventDetails
    }
}
