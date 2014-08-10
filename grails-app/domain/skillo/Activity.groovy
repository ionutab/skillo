package skillo

import org.joda.time.DateTime
import skillo.enums.ActivityType

/**
 * Activity
 * A domain class describes the data object and it's mapping to the database
 */
class Activity {

    Long domainModelId
    String name
    ActivityType type
    Date timestamp
    Long consultantId
    String consultantName

    static belongsTo = []

    static constraints = {
    }

}
