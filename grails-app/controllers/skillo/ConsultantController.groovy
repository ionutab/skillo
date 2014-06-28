package skillo

class ConsultantController extends BaseController {

    def settings() {
        log.info("ConCon.settings")
        Consultant consultant = getCurrentConsultant()

        render (view: "settings" , model: [consultant:consultant])
    }

    def saveSettings(){
        log.info("ConCon.saveSettings")
        log.info(params)

        def consultant = getCurrentConsultant()
        consultant.properties = params.consultant

        log.info consultant



        redirect(uri: "/")
    }


    def uploadPhoto(){
        log.info("ConCon.uploadPhoto")
        redirect(action: settings())
    }

}
