package skillo

import com.metasieve.magicnumbers.MagicNumbersMixin
import org.apache.commons.io.filefilter.MagicNumberFileFilter

/**
 * Document
 * A domain class describes the data object and it's mapping to the database
 */
class Document {

    String filename
    Date uploadDate = new Date()
    Long candidateId
    byte[] filedata
    Integer fileSize


    static mapping = {
    }

    static belongsTo =Candidate

    static constraints = {
        filedata(nullable: false,maxSize: 5242880) // max of 5mb
    }

}
