package skillo

class Note {
    
    Date date
    String note
    Boolean active = Boolean.TRUE
    
    static constraints = {
        note nullable: true, blank: false
        note type: 'text'
    }
}
