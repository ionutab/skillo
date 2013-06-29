package skilloo

class PayrollCompany {

    String name
    String details
    
    static hasMany = [payrolls: Payroll, workHistory: Job]

    static constraints = {
        name unique:true 
    }
}
