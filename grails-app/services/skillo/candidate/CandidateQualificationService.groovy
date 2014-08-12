package skillo.candidate

import grails.transaction.Transactional
import skillo.Qualification

/**
 * Created by ionutab on 7/12/2014.
 */
@Transactional
class CandidateQualificationService {

    def getMainTradeForCandidate(Candidate candidate){
        return CandidateQualification.findByCandidateAndIsMainTrade(candidate, true)
    }

    def initMainTradeByQualification(Long qualificationId){

        def qualification = Qualification.get(qualificationId)
        def candidateQualification = new CandidateQualification()

        if(qualification == null){
            return null
        }

        candidateQualification.qualification = qualification
        candidateQualification.isMainTrade = true
        return candidateQualification
    }

    def boolean save(CandidateQualification candidateQualification, Long candidateId){
        if(!candidateQualification || !candidateId){
            return false
        }

        Candidate candidate = Candidate.get(candidateId)
        candidateQualification.candidate = candidate

        return save(candidateQualification)
    }

    def boolean save(CandidateQualification candidatequalification){

        if(!candidatequalification){
            return false
        }

        if(candidatequalification.save(deepvalidate:true)){

            if(candidatequalification.isMainTrade){
                negateMainTradeOnOtherCandidateQualifications(candidatequalification)
            }

            return true
        } else {

            if(candidatequalification.hasErrors()){
                candidatequalification.errors.each {
                    println "fielderrors: " + it
                }
            }
            return false
        }
    }

    def boolean update(CandidateQualification candidatequalification){

        if (!candidatequalification.save(deepvalidate:true)) {
            if(candidatequalification.hasErrors()){
                candidatequalification.errors.each {
                    println "fielderrors: " + it
                }
            }
            return false
        }

        if(candidatequalification.isMainTrade){
            negateMainTradeOnOtherCandidateQualifications(candidatequalification)
        }

        return true
    }

    def boolean delete(Long candidateQualificationId){
        def candidateQualification = CandidateQualification.get(candidateQualificationId)
        return delete(candidateQualification)
    }

    def boolean delete(CandidateQualification candidateQualification){
        if (!candidateQualification) {
            return false
        }
        candidateQualification.active = false
        if (!candidateQualification.save(deepvalidate: true)) {
            return false
        }
        return true
    }

    /**
     * if the param candidate qualification is main trade negates main trade on the main trade of that candidate
     */
    def void negateMainTradeOnOtherCandidateQualifications(CandidateQualification newMainTrade){

        if(!newMainTrade.isMainTrade){
            return
        }

        def candidateQualifications = CandidateQualification.findAllByCandidateAndIsMainTrade(Candidate.get(newMainTrade.candidate.id), Boolean.TRUE)
        candidateQualifications.each { candidateQualification ->
            if (candidateQualification != newMainTrade) {
                //put the other qualifications to not be main trade
                candidateQualification.setIsMainTrade(Boolean.FALSE)
                candidateQualification.save()
            }
        }
    }

}
