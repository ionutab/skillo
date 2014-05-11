package skillo


class QualificationController {

    def scaffold = true
    def searchableService

    def index() {
        redirect(action: "list")
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)

        def qualificationList = Qualification.createCriteria().list(params) {}

        [QualificationList: qualificationList, QualificationTotal: Qualification.count()]
    }

    def show() {


        def qualificationInstance = new Qualification(params)
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

        def qualificationInstance =  new Qualification(params.qualification)

        if (qualificationInstance.save( flush: true)) {

            flash.message = "${message(code: 'default.created.message', args: [message(code: 'qualification.label', default: 'Qualification'), qualificationInstance.name])}"
            redirect(action: "show", params: params.qualification)

        } else {

            render(view: "create", model: [qualificationInstance: qualificationInstance])
        }


    }

    def update() {



        def qualificationInstance =  Qualification.get(params.id)

        if(qualificationInstance){
            if(params.version){
                def version = params.version.toLong()
                // log error if the instance was modified by somebody elseQualification
                if (qualificationInstance.version > version) {

                    qualificationInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'qualification.label', default: 'Qualification')] as Object[], "Another user has updated this Qualification while you were editing")
                    render(view: "edit", model: [qualificationInstance: qualificationInstance])
                    return
                }
            }

            qualificationInstance.properties = params.qualification
            if(!qualificationInstance.hasErrors() && qualificationInstance.save(flush: true)){
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'qualification.label', default: 'Qualification'), qualificationInstance.id])}"
                redirect(action: "show", params:params.qualification)
            }else{
                render(view: "edit", model: [qualificationInstance: qualificationInstance])
            }
        }else{
                flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'qualification.label', default: 'Qualification'), params.id])}"
                redirect(action: "list")
        }

    }

    def delete(){


        def qualificationInstance =  Qualification.get(params.id)
        if (qualificationInstance) {
            try {
                qualificationInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'qualification.label', default: 'Qualification'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'qualification.label', default: 'Qualification'), params.id])}"
                redirect(action: "show", id: params.id, params: params)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'qualification.label', default: 'Qualification'), params.id])}"
            redirect(action: "list")
        }
    }


    def String wrapSearchParm(value) {
        '%'+value+'%'
    }


    def search() {

        def qualificationResults = []
        if(params.name) {
            qualificationResults = trySearch { Qualification.findAllByNameIlike(wrapSearchParm(params.name)) }
        }

        render(view: "list", model: [searchResults: qualificationResults, searchCount: qualificationResults.size()])
    }

    private trySearch(Closure callable) {
        try {
            return callable()
        } catch (Exception e) {
            flash.message = "${message(code: 'qualification.search.noItems.label', args: [message(code: 'qualification.label', default: 'Qualification'), params.name])}"
            redirect(action: "list")
        }
    }

}
