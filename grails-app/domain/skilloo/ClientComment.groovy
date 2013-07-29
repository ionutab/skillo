package skilloo

class ClientComment {

    Contact contact
    Client clientCompany
    Consultant consultant
    
    Comment comment
    
    static embedded = ['comment']
    
    static constraints = {
    }
}
