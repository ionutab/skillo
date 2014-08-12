package skillo

import skillo.candidate.Candidate

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
