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

        if(!consultant.save()){
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

    def savePassword(){
        log.info("ConCon.savePassword")

        def consultant = getCurrentConsultant()

        if(!params.u_password || !securityService.isPasswordValid(consultant.user, params.u_password)){
            consultant.user.errors.rejectValue("password","password.invalid")

            render(view: "settings", model: [consultant: consultant])
            return
        }else{
            if(!params.newPassword || !params.retypePassword || params.newPassword != params.retypePassword){
                consultant.user.errors.rejectValue( "password","password.match")
                render(view: "settings", model: [consultant: consultant])
                return
            }else{
                consultant.user.password=params.newPassword;
                if(!consultant.user.save(deepvalidate:true)){
                    consultant.user.errors.each {
                        println "    FE: " + it.fieldError.field
                        println "    FE: " + it.fieldError.code
                    }
                    render(view: "settings", model: [consultant: consultant])
                    return
                }
            }
        }
        redirect(uri: "/")
    }

    def uploadPhoto(){
        log.info("ConCon.uploadPhoto")

        /*def consultant = getCurrentConsultant()
        def photo = request.getFile('photo') // 'files' is the name of the input
            if (photo.empty) {
                flash.message = "You must select a photo to upload"
            } else {
                consultant.photo = photo.getBytes()
                if(!consultant.save()) {
                    flash.message = "Failed to upload photo"
                }
            }*/

        render(view: "settings", model: [consultant: consultant])
        }


}
