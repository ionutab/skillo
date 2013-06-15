package skilloo

import org.springframework.dao.DataIntegrityViolationException

class PayrollCompanyController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [payrollCompanyInstanceList: PayrollCompany.list(params), payrollCompanyInstanceTotal: PayrollCompany.count()]
    }

    def create() {
        [payrollCompanyInstance: new PayrollCompany(params)]
    }

    def save() {
        def payrollCompanyInstance = new PayrollCompany(params)
        if (!payrollCompanyInstance.save(flush: true)) {
            render(view: "create", model: [payrollCompanyInstance: payrollCompanyInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'payrollCompany.label', default: 'PayrollCompany'), payrollCompanyInstance.id])
        redirect(action: "show", id: payrollCompanyInstance.id)
    }

    def show(Long id) {
        def payrollCompanyInstance = PayrollCompany.get(id)
        if (!payrollCompanyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'payrollCompany.label', default: 'PayrollCompany'), id])
            redirect(action: "list")
            return
        }

        [payrollCompanyInstance: payrollCompanyInstance]
    }

    def edit(Long id) {
        def payrollCompanyInstance = PayrollCompany.get(id)
        if (!payrollCompanyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'payrollCompany.label', default: 'PayrollCompany'), id])
            redirect(action: "list")
            return
        }

        [payrollCompanyInstance: payrollCompanyInstance]
    }

    def update(Long id, Long version) {
        def payrollCompanyInstance = PayrollCompany.get(id)
        if (!payrollCompanyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'payrollCompany.label', default: 'PayrollCompany'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (payrollCompanyInstance.version > version) {
                payrollCompanyInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'payrollCompany.label', default: 'PayrollCompany')] as Object[],
                          "Another user has updated this PayrollCompany while you were editing")
                render(view: "edit", model: [payrollCompanyInstance: payrollCompanyInstance])
                return
            }
        }

        payrollCompanyInstance.properties = params

        if (!payrollCompanyInstance.save(flush: true)) {
            render(view: "edit", model: [payrollCompanyInstance: payrollCompanyInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'payrollCompany.label', default: 'PayrollCompany'), payrollCompanyInstance.id])
        redirect(action: "show", id: payrollCompanyInstance.id)
    }

    def delete(Long id) {
        def payrollCompanyInstance = PayrollCompany.get(id)
        if (!payrollCompanyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'payrollCompany.label', default: 'PayrollCompany'), id])
            redirect(action: "list")
            return
        }

        try {
            payrollCompanyInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'payrollCompany.label', default: 'PayrollCompany'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'payrollCompany.label', default: 'PayrollCompany'), id])
            redirect(action: "show", id: id)
        }
    }
}
