package skillo

import org.apache.commons.logging.LogFactory

abstract class BaseController {

    static scaffold = false

    def securityService

    protected static final log = LogFactory.getLog(this)

    def getCurrentConsultant(){
        def user = securityService.getCurrentUser()

        return Consultant.findByUser(user)
    }

}
