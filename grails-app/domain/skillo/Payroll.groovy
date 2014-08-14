package skillo

import skillo.candidate.Candidate

class Payroll {
    
    PayrollCompany payrollCompany
    
    Boolean registered = Boolean.FALSE
    Boolean inducted = Boolean.FALSE
    
    String referenceNumber
    String nationalInsuranceNumber
    String registrationNumber
    String uniqueTaxReferenceNumber

    String sortCode
    String accountNumber

    static belongsTo = Candidate

    static constraints = {
        payrollCompany nullable: true
        referenceNumber nullable: true, blank: false
        nationalInsuranceNumber nullable: true, blank: false
        registrationNumber nullable: true, blank: false
        uniqueTaxReferenceNumber nullable: true, blank: false
        sortCode nullable: true, blank: false
        accountNumber nullable: true, blank: false
    }
}
