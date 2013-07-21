import skilloo.Role
import skilloo.User
import skilloo.UserRole

class BootStrap {

    def springSecurityService

    def init = { servletContext ->
        if (!User.count()) {
            def role = new Role(authority: 'ROLE_USER').save(flush: true)
            def user = new User(username: 'ditech', enabled: true, password:'ditech').save(flush: true)
            UserRole.create user, role, true

            assert User.count() == 1
            assert Role.count() == 1
            assert UserRole.count() == 1
        }

    }
    def destroy = {
    }
}
