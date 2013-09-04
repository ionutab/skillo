package skilloo

import java.util.Date;

class Note {
    
    NoteType type
    Date date
    String note
    Boolean active
    
    static constraints = {
        note nullable: true, blank: false
    }
}
