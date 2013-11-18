package skillo

import skillo.history.DefaultHistoryEvent
import skillo.history.DomainModelEvent

/**
 * CandidateEvent
 * A domain class describes the data object and it's mapping to the database
 */
class CandidateEvent implements DomainModelEvent {

    Candidate candidate
    DefaultHistoryEvent eventDetails = new DefaultHistoryEvent()

    static embedded = ['eventDetails']

    static constraints = {

    }

    @Override
    def setEventDetails(String eventDetails) {
        this.eventDetails.setDetails(eventDetails)
    }

    @Override
    def setEventDetails(DefaultHistoryEvent eventDetails) {
        this.eventDetails = eventDetails
    }
}
