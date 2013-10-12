package skilloo

class Address {

    String details
    Boolean active = Boolean.TRUE
    PostCode postCode

    static belongsTo = [candidate:Candidate,workSite:WorkSite]

    static constraints = {
        details blank: false

        candidate nullable: true
        workSite nullable: true
    }
}
