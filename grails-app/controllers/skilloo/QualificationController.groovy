package skilloo

class QualificationController {

    def scaffold = true

    def index() {
        redirect(action: "list")
    }

    def listModal() {
        println "Qualification list modal"
        params.max = Math.min(params.max ? params.int('max') : 10, 100)

        def qualificationList = Qualification.createCriteria().list(params) {}

        render(view: "modalList", model: [QualificationList: qualificationList, QualificationTotal: Qualification.count()])
    }
}
