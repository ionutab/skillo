package skillo.activity

import skillo.enums.DomainActivityType

/**
 * Created by Andrei-PC on 8/11/2014.
 */
class FieldChange {

    // the field of the candidate changed
    String fieldName
    //old field value
    String valueFrom
    //new field value
    String valueTo
    // the activity which belongs
    Activity activity
    // the domain model class for which activity is logged
    DomainActivityType domainActivityType

    static belongsTo = [activity:Activity]

    static constraints = {
        valueFrom nullable: true
        valueTo nullable: true
    }

}
