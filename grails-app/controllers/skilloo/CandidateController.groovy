package skilloo

import org.springframework.dao.DataIntegrityViolationException

class CandidateController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [candidateInstanceList: Candidate.list(params), candidateInstanceTotal: Candidate.count()]
    }

    def create() {
        [candidateInstance: new Candidate(params)]
    }

    def save() {
        def candidateInstance = new Candidate(params)
        if (!candidateInstance.save(flush: true)) {
            render(view: "create", model: [candidateInstance: candidateInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'candidate.label', default: 'Candidate'), candidateInstance.id])
        redirect(action: "show", id: candidateInstance.id)
    }

    def show(Long id) {
        def candidateInstance = Candidate.get(id)
        if (!candidateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'candidate.label', default: 'Candidate'), id])
            redirect(action: "list")
            return
        }

        [candidateInstance: candidateInstance]
    }

    def edit(Long id) {
        def candidateInstance = Candidate.get(id)
        if (!candidateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'candidate.label', default: 'Candidate'), id])
            redirect(action: "list")
            return
        }

        [candidateInstance: candidateInstance]
    }

    def update(Long id, Long version) {
        def candidateInstance = Candidate.get(id)
        if (!candidateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'candidate.label', default: 'Candidate'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (candidateInstance.version > version) {
                candidateInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'candidate.label', default: 'Candidate')] as Object[],
                          "Another user has updated this Candidate while you were editing")
                render(view: "edit", model: [candidateInstance: candidateInstance])
                return
            }
        }

        candidateInstance.properties = params

        if (!candidateInstance.save(flush: true)) {
            render(view: "edit", model: [candidateInstance: candidateInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'candidate.label', default: 'Candidate'), candidateInstance.id])
        redirect(action: "show", id: candidateInstance.id)
    }

    def delete(Long id) {
        def candidateInstance = Candidate.get(id)
        if (!candidateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'candidate.label', default: 'Candidate'), id])
            redirect(action: "list")
            return
        }

        try {
            candidateInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'candidate.label', default: 'Candidate'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'candidate.label', default: 'Candidate'), id])
            redirect(action: "show", id: id)
        }
    }
}
