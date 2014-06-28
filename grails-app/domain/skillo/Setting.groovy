package skillo

class Setting {
    
    String code
    String defaultValue

    static constraints = {
        code unique:true, blank: false
        defaultValue blank: false
    }
}