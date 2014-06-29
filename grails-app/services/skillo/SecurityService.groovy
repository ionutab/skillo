package skillo

import grails.plugins.springsecurity.SpringSecurityService

class SecurityService extends SpringSecurityService {

    static transactional = false

    def boolean isPasswordValid(User user, String password){
        if (!getPasswordEncoder().isPasswordValid(user.password, password, null /*salt*/)) {
            return false
        }
        return true
    }

    def User updateUserPassword(User user, String password){
        user.password = password
        user.passwordExpired = false
        return user
        // if you have password constraints check them here
    }

}
