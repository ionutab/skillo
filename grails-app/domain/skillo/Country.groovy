package skillo

import skillo.candidate.Candidate

/**
 * Country
 * A domain class describes the data object and it's mapping to the database
 */
class Country {

   String name
   String nationality

    static belongsTo = Candidate

    static mapping = {
    }

    static constraints = {
    }

    String toString() {
        return this.name
    }


}
