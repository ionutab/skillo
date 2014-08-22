package skillo

class Comment {
    
    String comment
    Boolean active = Boolean.TRUE

    Date dateCreated
    Date lastUpdated

    static constraints = {
        comment blank: false
    }

    static mapping = {
        autoTimestamp true
    }
}
