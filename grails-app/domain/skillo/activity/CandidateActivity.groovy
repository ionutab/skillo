package skillo.activity

import skillo.Consultant
import skillo.candidate.Candidate

/**
 * CandidateActivity
 * A domain class describes the data object and it's mapping to the database
 */
class CandidateActivity {

    String candidateName
    Candidate candidate
    String consultantName
    Consultant consultant
    Activity activity

    static embedded = ['activity']

    static hasMany = [fieldChanges:CandidateFieldChange]

    static mapping = {
    }

    static constraints = {
    }

}
