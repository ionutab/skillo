package skillo

abstract class BaseController {

    static scaffold = false

    def springSecurityService

    def getCurrentConsultant(){
        def user = springSecurityService.getCurrentUser()

        return Consultant.findByUser(user)
    }

}
