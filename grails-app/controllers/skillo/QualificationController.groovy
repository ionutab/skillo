package skillo


class QualificationController {

    def scaffold = true

    def index() {
        redirect(action: "list")
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 100, 1000)

        log.debug("PAGINATION: max " + params.max + " offset " + params.offset )

        def qualificationList = Qualification.createCriteria().list(params) {}

        log.info("Rendering ${qualificationList.size()} Qualifications of ${qualificationList.totalCount}")
        [QualificationList: qualificationList, QualificationTotal: qualificationList.totalCount]
    }

    def show() {

        def qualificationInstance = Qualification.get(params.id)
        if (!qualificationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'qualification.label', default: 'Qualification'), params.id])
            redirect(action: "list")
        }

        [qualificationInstance: qualificationInstance]
    }

    def edit() {

        def qualificationInstance = Qualification.get(params.id)

        if (!qualificationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'qualification.label', default: 'Qualification'), params.id])
            redirect(action: "list")
        }

        [qualificationInstance: qualificationInstance,id: qualificationInstance.id]
    }

    def create() {

        def qualificationInstance = new Qualification(params)

        [qualificationInstance: qualificationInstance]
    }

    def save() {

        def qualificationInstance = new Qualification(params)

        if (qualificationInstance.save( flush: true)) {

            flash.message = "${message(code: 'default.created.message', args: [message(code: 'qualification.label', default: 'Qualification'), qualificationInstance.name])}"
            redirect(action: "show", id: qualificationInstance.id)

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

            qualificationInstance.properties = params
            print(qualificationInstance.code)
            print(qualificationInstance.name)
            print(qualificationInstance.description)
            print(qualificationInstance.canBeMainTrade)
            if(!qualificationInstance.hasErrors() && qualificationInstance.save(flush: true)){
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'qualification.label', default: 'Qualification'), qualificationInstance.name])}"
                redirect(action: "show", id: qualificationInstance.id,qualificationInstance: qualificationInstance)
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
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'qualification.label', default: 'Qualification'), params.name])}"
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
