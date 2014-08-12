package skillo.candidate

import skillo.Consultant
import skillo.history.DefaultHistoryEvent
import skillo.history.DomainModelEvent

/**
 * CandidateEvent
 * A domain class describes the data object and it's mapping to the database
 */
class CandidateEvent implements DomainModelEvent {

    Consultant consultant

    DefaultHistoryEvent eventDetails = new DefaultHistoryEvent()

    static embedded = ['eventDetails']

    static belongsTo = [candidate:Candidate]

    static constraints = {

    }

    @Override
    def void setEventDetails(String eventDetails) {
        this.eventDetails.setDetails(eventDetails)
    }

    @Override
    def void setEventDetails(DefaultHistoryEvent eventDetails) {
        this.eventDetails = eventDetails
    }
}
