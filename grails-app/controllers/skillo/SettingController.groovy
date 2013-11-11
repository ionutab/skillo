package skillo

class SettingController {
    
    def scaffold = true

    def index() {
        redirect(action: "list")
    }
}
