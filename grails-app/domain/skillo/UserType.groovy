package skillo

class UserType {
    
    String code
    String description

    static constraints = {
        code unique:true, blank: false
        description blank: false
    }
}
