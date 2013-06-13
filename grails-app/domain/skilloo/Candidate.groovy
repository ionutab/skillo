package skilloo

class Candidate {

    String firstName
    String lastName
    Date birthDate
    boolean driver
    boolean sponsored
    boolean carOwner
    boolean active;

    Consultant consultant

    static constraints = {
        consultant(nullable: true)
    }
}
