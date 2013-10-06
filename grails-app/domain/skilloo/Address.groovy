package skilloo

class Address {

    String details
    Boolean active = Boolean.TRUE
    PostCode postCode

    static constraints = {
        details blank: false
    }
}
