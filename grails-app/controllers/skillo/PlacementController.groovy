package skillo

class PlacementController {

    def scaffold = true

    def index() {
        redirect(action: "list")
    }
}
