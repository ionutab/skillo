package skillo

class UserSettingController {
    
    def scaffold = false

    def index() {
        redirect(action: "list")
    }
}
