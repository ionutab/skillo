package skilloo

class Qualification {

    String code
    String name
    String description

    static constraints = {
        code unique:true
        name unique:true
        description nullable:true
    }
}
