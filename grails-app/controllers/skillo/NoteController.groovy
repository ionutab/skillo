package skillo

class NoteController {
    
    def scaffold = true

    def index() {
        redirect(action: "list")
    }
}
