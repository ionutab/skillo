package skilloo

class Comment {
    
    Date date
    String comment
    Boolean active

    static constraints = {
        comment blank: false
    }
}
