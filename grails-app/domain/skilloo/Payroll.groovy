package skilloo

class Payroll {
    
    PayrollCompany payrollCompany
    
    Boolean registered
    Boolean inducted
    
    String referenceNumber
    String nationalInsuranceNumber
    String registrationNumber
    String unqiueTaxReferenceNumber

    static belongsTo = [candidate:Candidate]

    static constraints = {
        referenceNumber nullable: true, blank: false
        nationalInsuranceNumber nullable: true, blank: false
        registrationNumber nullable: true, blank: false
        unqiueTaxReferenceNumber nullable: true, blank: false
    }
}
