package skillo

class Note {
    
    Date date
    String note
    Boolean active
    
    static constraints = {
        note nullable: true, blank: false
    }
}
