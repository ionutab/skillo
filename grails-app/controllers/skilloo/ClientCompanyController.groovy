package skilloo

import org.springframework.dao.DataIntegrityViolationException

class ClientCompanyController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [clientCompanyInstanceList: ClientCompany.list(params), clientCompanyInstanceTotal: ClientCompany.count()]
    }

    def create() {
        [clientCompanyInstance: new ClientCompany(params)]
    }

    def save() {
        def clientCompanyInstance = new ClientCompany(params)
        if (!clientCompanyInstance.save(flush: true)) {
            render(view: "create", model: [clientCompanyInstance: clientCompanyInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'clientCompany.label', default: 'ClientCompany'), clientCompanyInstance.id])
        redirect(action: "show", id: clientCompanyInstance.id)
    }

    def show(Long id) {
        def clientCompanyInstance = ClientCompany.get(id)
        if (!clientCompanyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'clientCompany.label', default: 'ClientCompany'), id])
            redirect(action: "list")
            return
        }

        [clientCompanyInstance: clientCompanyInstance]
    }

    def edit(Long id) {
        def clientCompanyInstance = ClientCompany.get(id)
        if (!clientCompanyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'clientCompany.label', default: 'ClientCompany'), id])
            redirect(action: "list")
            return
        }

        [clientCompanyInstance: clientCompanyInstance]
    }

    def update(Long id, Long version) {
        def clientCompanyInstance = ClientCompany.get(id)
        if (!clientCompanyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'clientCompany.label', default: 'ClientCompany'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (clientCompanyInstance.version > version) {
                clientCompanyInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'clientCompany.label', default: 'ClientCompany')] as Object[],
                          "Another user has updated this ClientCompany while you were editing")
                render(view: "edit", model: [clientCompanyInstance: clientCompanyInstance])
                return
            }
        }

        clientCompanyInstance.properties = params

        if (!clientCompanyInstance.save(flush: true)) {
            render(view: "edit", model: [clientCompanyInstance: clientCompanyInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'clientCompany.label', default: 'ClientCompany'), clientCompanyInstance.id])
        redirect(action: "show", id: clientCompanyInstance.id)
    }

    def delete(Long id) {
        def clientCompanyInstance = ClientCompany.get(id)
        if (!clientCompanyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'clientCompany.label', default: 'ClientCompany'), id])
            redirect(action: "list")
            return
        }

        try {
            clientCompanyInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'clientCompany.label', default: 'ClientCompany'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'clientCompany.label', default: 'ClientCompany'), id])
            redirect(action: "show", id: id)
        }
    }
}
