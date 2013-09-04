package skilloo

class Address {

    String details
    Boolean active
    PostCode postCode

    static constraints = {
        details blank: false
    }
}
