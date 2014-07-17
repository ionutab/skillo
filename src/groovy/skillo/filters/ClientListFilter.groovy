package skillo.filters

class ClientListFilter extends BasicPaginatedSearchFilter {

    String name

    String registrationNumber

    String getName() {
        return name
    }

    void setName(String name) {
        this.name = name
    }

    String getRegistrationNumber() {
        return registrationNumber
    }

    void setRegistrationNumber(String registrationNumber) {
        this.registrationNumber = registrationNumber
    }
}
