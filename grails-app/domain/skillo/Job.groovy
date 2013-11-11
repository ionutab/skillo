package skillo

class Job {
    
    String candidatePosition
    Date start
    Date end
    Integer jobRate
    
    Candidate candidate
    PayrollCompany payrollCompany

    static constraints = {
        candidatePosition nullable: true, blank: false
    }
}
