package skilloo

class Setting {
    
    String code
    String defaultValue

    static constraints = {
        code unique:true 
    }
}
