package skilloo

class PayrollCompany {

    String name
    String details
    
    static hasMany = [payrolls: Payroll]

    static constraints = {
    }
}
