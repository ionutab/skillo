package skilloo

class UserSetting {
    
    User user
    Setting setting
    String value

    static constraints = {
        value blank: false
    }
    
}
