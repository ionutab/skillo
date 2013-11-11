package skillo

class ClientCommentController {
    
    def scaffold = true

    def index() {
        redirect(action: "list")
    }
}
