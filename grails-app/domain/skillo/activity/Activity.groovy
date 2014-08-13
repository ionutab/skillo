package skillo.activity

import skillo.enums.ActivityType

/**
 * Activity
 * A domain class describes the data object and it's mapping to the database
 */
class Activity {

    ActivityType type
    Date timestamp

    static constraints = {

    }

}
