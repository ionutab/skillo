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
            def userMihai = new User(username: 'mihai.cirstean', enabled: true, password: 'mihai').save(flush: true)
            def userAlexandru = new User(username: 'abujdei', enabled: true, password: 'abujdei').save(flush: true)

            new Consultant(firstName: 'John', lastName: 'Shepard', email: 'bujdei_alexandru@yahoo.com', user: user ).save(flush: true)
            new Consultant(firstName: 'Mihai', lastName: 'Cirstean', email: 'mihai.cirstean@gmail.com', user: userMihai ).save(flush: true)
            new Consultant(firstName: 'Alexandru Ionut', lastName: 'Bujdei', email: 'bujdeialexandru@gmail.com', user: userAlexandru ).save(flush: true)

            UserRole.create user, role, true
            UserRole.create userMihai, role, true
            UserRole.create userAlexandru, role, true


            assert User.count() == 3
            assert Role.count() == 1
            assert UserRole.count() == 3

        }

    }
    def destroy = {
    }
}
