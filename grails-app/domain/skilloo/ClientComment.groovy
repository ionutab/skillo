package skilloo

class ClientComment {

    Contact contact
    ClientCompany clientCompany
    Consultant consultant
    
    Comment comment
    
    static embedded = ['comment']
    
    static constraints = {
    }
}
