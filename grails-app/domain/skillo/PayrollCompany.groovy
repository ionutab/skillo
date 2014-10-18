package skillo

import grails.plugin.multitenant.core.annotation.MultiTenant

@MultiTenant
class PayrollCompany {

    String name
    String details
    
    static hasMany = [payrolls: Payroll, workHistory: Job]

    static constraints = {
        name unique:true, blank: false
        details nullable: true, blank: false
    }
}
