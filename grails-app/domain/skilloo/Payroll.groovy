package skilloo

class Payroll {
    
    Candidate candidate
    PayrollCompany payrollCompany
    
    Boolean registered
    Boolean inducted
    
    String referenceNumber
    String nationalInsuranceNumber
    String registrationNumber
    String unqiueTaxReferenceNumber

    static constraints = {
        referenceNumber nullable: true, blank: false
        nationalInsuranceNumber nullable: true, blank: false
        registrationNumber nullable: true, blank: false
        unqiueTaxReferenceNumber nullable: true, blank: false
    }
}
