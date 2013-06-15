package skilloo

import org.springframework.dao.DataIntegrityViolationException

class CandidateAddressController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [candidateAddressInstanceList: CandidateAddress.list(params), candidateAddressInstanceTotal: CandidateAddress.count()]
    }

    def create() {
        [candidateAddressInstance: new CandidateAddress(params)]
    }

    def save() {
        def candidateAddressInstance = new CandidateAddress(params)
        if (!candidateAddressInstance.save(flush: true)) {
            render(view: "create", model: [candidateAddressInstance: candidateAddressInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'candidateAddress.label', default: 'CandidateAddress'), candidateAddressInstance.id])
        redirect(action: "show", id: candidateAddressInstance.id)
    }

    def show(Long id) {
        def candidateAddressInstance = CandidateAddress.get(id)
        if (!candidateAddressInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'candidateAddress.label', default: 'CandidateAddress'), id])
            redirect(action: "list")
            return
        }

        [candidateAddressInstance: candidateAddressInstance]
    }

    def edit(Long id) {
        def candidateAddressInstance = CandidateAddress.get(id)
        if (!candidateAddressInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'candidateAddress.label', default: 'CandidateAddress'), id])
            redirect(action: "list")
            return
        }

        [candidateAddressInstance: candidateAddressInstance]
    }

    def update(Long id, Long version) {
        def candidateAddressInstance = CandidateAddress.get(id)
        if (!candidateAddressInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'candidateAddress.label', default: 'CandidateAddress'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (candidateAddressInstance.version > version) {
                candidateAddressInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'candidateAddress.label', default: 'CandidateAddress')] as Object[],
                          "Another user has updated this CandidateAddress while you were editing")
                render(view: "edit", model: [candidateAddressInstance: candidateAddressInstance])
                return
            }
        }

        candidateAddressInstance.properties = params

        if (!candidateAddressInstance.save(flush: true)) {
            render(view: "edit", model: [candidateAddressInstance: candidateAddressInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'candidateAddress.label', default: 'CandidateAddress'), candidateAddressInstance.id])
        redirect(action: "show", id: candidateAddressInstance.id)
    }

    def delete(Long id) {
        def candidateAddressInstance = CandidateAddress.get(id)
        if (!candidateAddressInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'candidateAddress.label', default: 'CandidateAddress'), id])
            redirect(action: "list")
            return
        }

        try {
            candidateAddressInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'candidateAddress.label', default: 'CandidateAddress'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'candidateAddress.label', default: 'CandidateAddress'), id])
            redirect(action: "show", id: id)
        }
    }
}
