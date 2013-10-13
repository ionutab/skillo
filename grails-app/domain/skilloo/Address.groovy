package skilloo

class Address {

    String details
    Boolean active = Boolean.TRUE
    PostCode postCode

    static belongsTo = [Candidate,WorkSite]

    static constraints = {
        details blank: false
    }
}
