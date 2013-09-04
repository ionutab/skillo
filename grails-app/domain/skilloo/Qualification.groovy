package skilloo

class Qualification {

    String code
    String name
    String description
    Boolean canBeMainTrade

    static constraints = {
        code nullable: true, unique:true
        name nullable: false, unique:true
        description nullable:true
    }
}
