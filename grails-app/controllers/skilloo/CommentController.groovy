package skilloo

class CommentController {
    
    def scaffold = true

    def index() {
        redirect(action: "list")
    }
}
