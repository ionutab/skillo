package skilloo

class User {
    
    String name
    String password
    
    UserType userType

    static hasOne = [userSettings:UserSetting, userDetails:UserDetails]
    
    static constraints = {
    }
}
