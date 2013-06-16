package skilloo

class WorkSiteController {
    
    def scaffold = true
    
    def index() {
        redirect(action: "list")
    }
}
