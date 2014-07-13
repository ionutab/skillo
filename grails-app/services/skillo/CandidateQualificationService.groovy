package skillo

/**
 * Created by ionutab on 7/12/2014.
 */
class CandidateQualificationService {

    def getMainTradeForCandidate(Candidate candidate){
        return CandidateQualification.findByCandidateAndIsMainTrade(candidate, true)
    }


}
