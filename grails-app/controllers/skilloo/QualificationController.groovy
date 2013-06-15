package skilloo

import org.springframework.dao.DataIntegrityViolationException

class QualificationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [qualificationInstanceList: Qualification.list(params), qualificationInstanceTotal: Qualification.count()]
    }

    def create() {
        [qualificationInstance: new Qualification(params)]
    }

    def save() {
        def qualificationInstance = new Qualification(params)
        if (!qualificationInstance.save(flush: true)) {
            render(view: "create", model: [qualificationInstance: qualificationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'qualification.label', default: 'Qualification'), qualificationInstance.id])
        redirect(action: "show", id: qualificationInstance.id)
    }

    def show(Long id) {
        def qualificationInstance = Qualification.get(id)
        if (!qualificationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'qualification.label', default: 'Qualification'), id])
            redirect(action: "list")
            return
        }

        [qualificationInstance: qualificationInstance]
    }

    def edit(Long id) {
        def qualificationInstance = Qualification.get(id)
        if (!qualificationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'qualification.label', default: 'Qualification'), id])
            redirect(action: "list")
            return
        }

        [qualificationInstance: qualificationInstance]
    }

    def update(Long id, Long version) {
        def qualificationInstance = Qualification.get(id)
        if (!qualificationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'qualification.label', default: 'Qualification'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (qualificationInstance.version > version) {
                qualificationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'qualification.label', default: 'Qualification')] as Object[],
                          "Another user has updated this Qualification while you were editing")
                render(view: "edit", model: [qualificationInstance: qualificationInstance])
                return
            }
        }

        qualificationInstance.properties = params

        if (!qualificationInstance.save(flush: true)) {
            render(view: "edit", model: [qualificationInstance: qualificationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'qualification.label', default: 'Qualification'), qualificationInstance.id])
        redirect(action: "show", id: qualificationInstance.id)
    }

    def delete(Long id) {
        def qualificationInstance = Qualification.get(id)
        if (!qualificationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'qualification.label', default: 'Qualification'), id])
            redirect(action: "list")
            return
        }

        try {
            qualificationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'qualification.label', default: 'Qualification'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'qualification.label', default: 'Qualification'), id])
            redirect(action: "show", id: id)
        }
    }
}
