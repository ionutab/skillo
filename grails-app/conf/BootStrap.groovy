import skillo.Consultant
import skillo.PostCode
import skillo.Qualification
import skillo.Role
import skillo.user.User
import skillo.user.UserRole

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
