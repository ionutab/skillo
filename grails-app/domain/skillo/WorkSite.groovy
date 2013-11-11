package skillo

class WorkSite {

    Address address
    Client clientCompany
    String details
    
    static constraints = {
        details blank: false
    }
}
