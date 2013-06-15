package skilloo

import org.springframework.dao.DataIntegrityViolationException

class ClientContactController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [clientContactInstanceList: ClientContact.list(params), clientContactInstanceTotal: ClientContact.count()]
    }

    def create() {
        [clientContactInstance: new ClientContact(params)]
    }

    def save() {
        def clientContactInstance = new ClientContact(params)
        if (!clientContactInstance.save(flush: true)) {
            render(view: "create", model: [clientContactInstance: clientContactInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'clientContact.label', default: 'ClientContact'), clientContactInstance.id])
        redirect(action: "show", id: clientContactInstance.id)
    }

    def show(Long id) {
        def clientContactInstance = ClientContact.get(id)
        if (!clientContactInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'clientContact.label', default: 'ClientContact'), id])
            redirect(action: "list")
            return
        }

        [clientContactInstance: clientContactInstance]
    }

    def edit(Long id) {
        def clientContactInstance = ClientContact.get(id)
        if (!clientContactInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'clientContact.label', default: 'ClientContact'), id])
            redirect(action: "list")
            return
        }

        [clientContactInstance: clientContactInstance]
    }

    def update(Long id, Long version) {
        def clientContactInstance = ClientContact.get(id)
        if (!clientContactInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'clientContact.label', default: 'ClientContact'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (clientContactInstance.version > version) {
                clientContactInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'clientContact.label', default: 'ClientContact')] as Object[],
                          "Another user has updated this ClientContact while you were editing")
                render(view: "edit", model: [clientContactInstance: clientContactInstance])
                return
            }
        }

        clientContactInstance.properties = params

        if (!clientContactInstance.save(flush: true)) {
            render(view: "edit", model: [clientContactInstance: clientContactInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'clientContact.label', default: 'ClientContact'), clientContactInstance.id])
        redirect(action: "show", id: clientContactInstance.id)
    }

    def delete(Long id) {
        def clientContactInstance = ClientContact.get(id)
        if (!clientContactInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'clientContact.label', default: 'ClientContact'), id])
            redirect(action: "list")
            return
        }

        try {
            clientContactInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'clientContact.label', default: 'ClientContact'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'clientContact.label', default: 'ClientContact'), id])
            redirect(action: "show", id: id)
        }
    }
}
