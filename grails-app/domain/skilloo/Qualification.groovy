package skilloo

class Qualification {

    String code
    String name
    String description
    Boolean isMainTrade

    static constraints = {
        code unique:true
        name unique:true
        description nullable:true

    }
}
