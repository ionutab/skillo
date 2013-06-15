package skilloo

class PayrollCompany {

    String name
    String details

    static belongsTo = Candidate

    static hasMany = [candidates:Candidate]

    static constraints = {
    }
}
