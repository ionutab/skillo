package skillo

class NoteTypeController {

    def scaffold = true
    
    def index() {
        redirect(action: "list")
    }
}
