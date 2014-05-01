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
        def qualificationInstance = Qualification.get(params.id)
        if (!qualificationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'qualification.label', default: 'Qualification'), params.id])
            redirect(action: "list")
            return
        }

        [qualificationInstance: qualificationInstance]
    }

    def edit() {


        def qualificationInstance = Qualification.get(params.id)

        if (!qualificationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'qualification.label', default: 'Qualification'), params.id])
            redirect(action: "list")
            return
        }

        log.info("Qualification { ${qualificationInstance.name} } edited")

        [qualificationInstance: qualificationInstance]
    }

    def create() {
        def qualificationInstance = new Qualification(params)

        [qualificationInstance: qualificationInstance]
    }

    def save() {

        def qualificationInstance = new Qualification(params.qualification)

        if (!qualificationInstance.save(deepvalidate: true, flush: true)) {
            if (qualificationInstance.hasErrors()) {
                qualificationInstance.errors.each {
                    log.info("Failed to save qualification { ${qualificationInstance.name} }")
                }

            }
            render(view: "create", model: [qualificationInstance: qualificationInstance])
        } else {

            flash.message = message(code: 'default.created.message', args: [message(code: 'qualification.label', default: 'Qualification'), qualificationInstance.name])
            redirect(action: "list")
        }
    }

    def update() {

        def qualificationInstance =  Qualification.get(params.id)

        print("Params ----------> "+params)

        bindData(qualificationInstance, params, [include: ['code', 'name', 'description','canBeMainTrade']])

        print("hhhhh -------------> "+qualificationInstance.code)
        print("hhhhh -------------> "+qualificationInstance.name)
        print("hhhhh -------------> "+qualificationInstance.description)
        print("hhhhh -------------> "+qualificationInstance.canBeMainTrade)

        if(qualificationInstance.save()){
            log.info("Qualification { ${qualificationInstance.name} } updated")
            redirect action: "show", id:qualificationInstance.id
        }else{

            render view: "edit", model: [qualification:qualificationInstance]
        }


    }

    def delete(){

        def qualificationInstance = new Qualification(params.qualification)

        try {
            qualificationInstance.delete(flush: true)
            flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'qualification.label', default: 'Qualification'), qualificationInstance.name])}"
            redirect(action: "list")
        }catch (org.springframework.dao.DataIntegrityViolationException e) {
            flash.message = "${message(code: 'default.not.deleted.message',  args: [message(code: 'qualification.label', default: 'Qualification'), qualificationInstance.name])}"
            redirect(action: "show", id: params.id)
        }
    }

}
