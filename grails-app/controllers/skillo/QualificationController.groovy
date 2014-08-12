package skillo

import skillo.filters.QualificationSearchFilter


class QualificationController extends BaseController {

    def qualificationService

    def index() {
        redirect(action: "list")
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)

        log.debug("PAGINATION: max " + params.max + " offset " + params.offset)

        QualificationSearchFilter filter = new QualificationSearchFilter()
        if(!params.reset){
            bindData(filter,params)
        }

        def qualificationList = qualificationService.search(filter)

        log.info("Rendering ${qualificationList.size()} Qualifications of ${qualificationList.totalCount}")
        [QualificationList: qualificationList, QualificationTotal: qualificationList.totalCount]
    }


    def edit() {

        def qualificationInstance = Qualification.get(params.id)

        if (!qualificationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'qualification.label', default: 'Qualification'), params.id])
            redirect(action: "list")
        }

        [qualificationInstance: qualificationInstance, id: qualificationInstance.id]
    }

    def create() {

        def qualificationInstance = new Qualification(params)

        [qualificationInstance: qualificationInstance]
    }

    def save() {

        if (params.cancel) {
            redirect(action: "list")
        }

        def qualificationInstance = new Qualification(params)

        if (qualificationInstance.save(flush: true)) {

            flash.message = "${message(code: 'default.created.message', args: [message(code: 'qualification.label', default: 'Qualification'), qualificationInstance.name])}"
            redirect(action: "list")

        } else {
            render(view: "create", model: [qualificationInstance: qualificationInstance])
        }


    }

    def update() {

        def qualificationInstance = Qualification.get(params.id)

        if (qualificationInstance) {
            if (params.version) {
                def version = params.version.toLong()
                // log error if the instance was modified by somebody elseQualification
                if (qualificationInstance.version > version) {
                    qualificationInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'qualification.label', default: 'Qualification')] as Object[], "Another user has updated this Qualification while you were editing")
                    render(view: "edit", model: [qualificationInstance: qualificationInstance])
                    return
                }
            }

            qualificationInstance.properties = params

            if (!qualificationInstance.hasErrors() && qualificationInstance.save(flush: true)) {
                redirect(action: "list")
            } else {
                render(view: "edit", model: [qualificationInstance: qualificationInstance])
            }
        } else {
            redirect(action: "list")
        }

    }

    def delete() {
        def qualificationInstance = Qualification.get(params.id)
        if (qualificationInstance) {
            try {
                qualificationInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'qualification.label', default: 'Qualification'), params.name])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'qualification.label', default: 'Qualification'), params.id])}"
                redirect(action: "list")
            }
        } else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'qualification.label', default: 'Qualification'), params.id])}"
            redirect(action: "list")
        }
    }

    def getQualificationsByName(){
        def qualification = request.getParameter("inputCode")
        def qualificationList

        if(qualification != null && qualification.size() > 0){
            qualificationList = Qualification.findAllByNameIlike("%${qualification}%")
        } else {
            qualificationList = Qualification.list()
        }

        render( qualificationList as grails.converters.JSON )
        return
    }
}
