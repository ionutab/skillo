package skillo

abstract class BaseController {

    static scaffold = false

    def securityService

    def getCurrentConsultant(){
        def user = securityService.getCurrentUser()

        log.info "t1"
        return Consultant.findByUser(user)
    }

}
