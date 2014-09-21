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
