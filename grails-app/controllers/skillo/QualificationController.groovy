package skillo

class QualificationController {

    def scaffold = true

    def index() {
        redirect(action: "list")
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)

        def qualificationList = Qualification.createCriteria().list(params) {}

        [QualificationList: qualificationList, QualificationTotal: Qualification.count()]
    }

    def show() {
        def qualification = Qualification.get(params.id)
        if (!qualification) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'qualification.label', default: 'Qualification'), params.id])
            redirect(action: "list")
            return
        }

        [qualificationInstance: qualification]
    }

    def edit() {


        def qualification = Qualification.get(params.id)

        if (!qualification) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'qualification.label', default: 'Qualification'), params.id])
            redirect(action: "list")
            return
        }

        log.info("Qualification { ${qualification.name} } edited")

        [qualificationInstance: qualification]
    }

    def create() {
        def qualification = new Qualification(params)

        [qualificationInstance: qualification]
    }

    def save() {

        def qualification = new Qualification(params.qualification)

        if (!qualification.save(deepvalidate: true, flush: true)) {
            if (qualification.hasErrors()) {
                qualification.errors.each {
                    log.info("Failed to save qualification { ${qualification.name} }")
                }

            }
            render(view: "create", model: [qualificationInstance: qualification])
        } else {

            flash.message = message(code: 'default.created.message', args: [message(code: 'qualification.label', default: 'Qualification'), qualification.name])
            redirect(action: "list")
        }
    }

    def update() {
        def qualification = new Qualification(params.qualification)


        if (params.version) {
            def version = params.version.toLong()
            if (qualification.version > version) {
                log.info("Failed to update qualification { ${qualification.name} }")
                render(view: "edit", model: [qualificationInstance: qualification])
            } else {
                qualification.properties = params
                if (!qualification.hasErrors() && qualification.save(flush: true)) {

                    flash.message = message(code: 'default.updated.message', args: [message(code: 'qualification.label', default: 'Qualification'), qualification.name])
                    redirect(action: "list")
                }
            }
        }


    }

    def delete(){
        def qualification = new Qualification(params.qualification)

        try {
            qualification.delete(flush: true)
            flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'qualification.label', default: 'Qualification'), qualification.name])}"
            redirect(action: "list")
        }catch (org.springframework.dao.DataIntegrityViolationException e) {
            flash.message = "${message(code: 'default.not.deleted.message',  args: [message(code: 'qualification.label', default: 'Qualification'), qualification.name])}"
            redirect(action: "show", id: params.id)
        }
    }

}
