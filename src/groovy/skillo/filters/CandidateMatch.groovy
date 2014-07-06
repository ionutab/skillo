package skillo.filters

/**
 * Created by Andrei-Home on 7/6/2014.
 */
class CandidateMatch extends BasicPaginatedSearchFilter {

    protected String firstName

    protected String lastName

    protected String telephoneNumber

    String getFirstName() {
        return firstName
    }

    void setFirstName(String firstName) {
        this.firstName = firstName
    }

    String getLastName() {
        return lastName
    }

    void setLastName(String lastName) {
        this.lastName = lastName
    }

    String getTelephoneNumber() {
        return telephoneNumber
    }

    void setTelephoneNumber(String telephoneNumber) {
        this.telephoneNumber = telephoneNumber
    }
}
