import skillo.Consultant
import skillo.Role
import skillo.User
import skillo.UserRole

class BootStrap {

    def springSecurityService

    def init = { servletContext ->

        if (!User.count()) {
            def role = new Role(authority: 'ROLE_USER').save(flush: true)
            def user = new User(username: 'skillo', enabled: true, password: 'skillo').save(flush: true)
            new Consultant(firstName: 'John', lastName: 'Shepard', email: 'bujdeialexandru@gmail.com', user: user ).save(flush: true)

            UserRole.create user, role, true

            assert User.count() == 1
            assert Role.count() == 1
            assert UserRole.count() == 1
        }

    }
    def destroy = {
    }
}
