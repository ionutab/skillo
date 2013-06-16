package skilloo

class UserSettingController {
    
    def scaffold = true

    def index() {
        redirect(action: "list")
    }
}
