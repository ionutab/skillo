package skillo

class ConsultantController extends BaseController {

    def settings() {
        log.info("ConCon.settings")
        Consultant consultant = getCurrentConsultant()

        render (view: "settings" , model: [consultant:consultant])
    }

    def saveSettings(){
        log.info("ConCon.saveSettings")

        def consultant = getCurrentConsultant()
        consultant.properties = params.consultant

        /*
        boolean isPasswordValid = true
        boolean isPassword = false
        if(params.u_password){
            isPassword = true
        }
        */

        /*
        if(params.u_password && params.newPassword && params.retypePassword){
            if(!securityService.isPasswordValid(consultant.user, params.u_password)){
                consultant.user.errors.reject("password.invalid")
                isPasswordValid = false
            }
            if(securityService.isPasswordValid(consultant.user, params.newPassword)){
                consultant.user.errors.reject("password.old")
                isPasswordValid = false
            }
        } else if(params.u_password && (params.newPassword || params.retypePassword)){
                consultant.user.errors.reject("password.match")
                isPasswordValid = false
        } else if (!params.u_password && (params.newPassword || params.retypePassword)){
            consultant.user.errors.reject("password.invalid")
            isPasswordValid = false
        } else if (params.u_password && !(params.newPassword == params.retypePassword)){
            consultant.user.errors.reject("password.new")
            isPasswordValid = false
        }

        log.info("ispassvalid = " + isPasswordValid)
        if(isPassword && isPasswordValid){
            consultant.user = securityService.updateUserPassword(consultant.user, params.newPassword)
        }
        */

//        log.info("saving " + consultant.user.password)
        if(!consultant.save(deepvalidate: true)){
            if(consultant.hasErrors()){
                consultant.errors.each {
                    println "    FE: " + it.fieldError.field
                    println "    FE: " + it.fieldError.code
                }
            }
            render(view: "settings", model: [consultant: consultant])
            return
        }

        redirect(uri: "/")
    }

    def uploadPhoto(){
        log.info("ConCon.uploadPhoto")
        redirect(action: settings())
    }

}
