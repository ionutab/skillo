import skillo.Consultant
import skillo.PostCode
import skillo.Qualification
import skillo.Role
import skillo.User
import skillo.UserRole

class BootStrap {

    def springSecurityService

    def initService

    def init = { servletContext ->

        if(!initService.isInited()){
            initService.loadDefaultSuperuserAndRole()
            initService.loadDefaultQualificationsAndPostCodes()
        }

    }

    def destroy = {
    }


}
