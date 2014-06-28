package skillo

abstract class BaseController {

    static scaffold = false

    def springSecurityService

    def getCurrentConsultant(){
        def user = springSecurityService.getCurrentUser()

        log.info "t1"
        return Consultant.findByUser(user)
    }

}
