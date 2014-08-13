package skillo.activity

/**
 * Created by Andrei-PC on 8/11/2014.
 */
class CandidateFieldChange {

    // the field of the candidate changed
    String fieldName
    //old field value
    String valueFrom
    //new field value
    String valueTo
    // the activity which belongs
    CandidateActivity activity

    static belongsTo = [activity:CandidateActivity]

}
