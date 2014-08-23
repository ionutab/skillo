package skillo.activity

import org.joda.time.DateTime
import org.joda.time.DateTimeZone
import skillo.enums.ActivityType
import skillo.enums.DomainActivityType

/**
 * Activity
 * A domain class describes the data object and it's mapping to the database
 */
class Activity {


    // the id of the domain object for which this activity was logged
    Long ownerId
    // the name of the object modified
    String modifiedObjectName
    // every object is modified by a consultant. Here we have the consultant name
    String consultantName
    // CRUD type of the activity
    ActivityType type
    // time when the activity was logged
    Date timestamp
    // the domain model class for which activity is logged
    DomainActivityType domainActivityType

    static hasMany = [fieldChanges:FieldChange]

    static constraints = {
        domainActivityType nullable: true
    }


    public Activity(){
        // set timestamp in UTC time
        DateTime nowUtc = DateTime.now( DateTimeZone.UTC )
        timestamp=nowUtc.toDate()
    }


}
