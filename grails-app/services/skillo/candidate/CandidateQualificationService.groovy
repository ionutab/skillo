package skillo.candidate

import skillo.Qualification
import skillo.candidate.Candidate
import skillo.candidate.CandidateQualification

/**
 * Created by ionutab on 7/12/2014.
 */
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

}
