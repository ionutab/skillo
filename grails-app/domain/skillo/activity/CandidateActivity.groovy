package skillo.activity

import skillo.Consultant
import skillo.candidate.Candidate

/**
 * CandidateActivity
 * A domain class describes the data object and it's mapping to the database
 */
class CandidateActivity  extends Activity{

    Candidate candidate
    Consultant consultant

    static hasMany = [fieldChanges:CandidateFieldChange]

    static mapping = {
    }

    static constraints = {
    }

}
