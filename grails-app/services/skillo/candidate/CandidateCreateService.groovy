package skillo.candidate

import org.joda.time.DateTime
import org.joda.time.LocalDate

class CandidateCreateService {

     def getNewDefaultCandidate(){

         def candidate = new Candidate()
         candidate.driver = true
         candidate.carOwner = true
         candidate.sponsored = true

         return candidate
     }

    def boolean save(Candidate candidate){

        if(!candidate){
            return false
        }

        if (candidate.birthDate != null) {

            DateTime now = new LocalDate().toDateTimeAtStartOfDay()
            DateTime birthDate = new DateTime(candidate.birthDate)

            if (now.isBefore(birthDate)) {
                candidate.errors.rejectValue("birthDate", "custom.invalid.date")
            }
        }

        if(candidate.save(deepvalidate:true, flush: true)){
            return true
        } else {
            if(candidate.hasErrors()){
                candidate.errors.each {
                    println "fielderrors: " + it
                }
            }
            return false
        }


    }
}
