package skillo.filters

class CandidateListSearch extends BasicPaginatedSearchFilter {

    private String firstName

    private String lastName

    private String telephoneNumber

    private String qualification

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

    String getQualification() {
        return qualification
    }

    void setQualification(String qualification) {
        this.qualification = qualification
    }
}
