package skillo.activity

/**
 * Created by Andrei-PC on 8/11/2014.
 */
class CandidateFieldChange {

    // the field of the candidate changed
    String fieldName
    //old field value
    String from
    //new field value
    String to

    static belongsTo = [activity:CandidateActivity]

}
