package skilloo

class UserType {
    
    String code
    String description

    static constraints = {
        code unique:true 
    }
}
