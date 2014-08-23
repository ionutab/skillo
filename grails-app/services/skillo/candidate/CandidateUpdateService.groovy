package skillo.candidate

import grails.transaction.Transactional
import skillo.candidate.Candidate

@Transactional
class CandidateUpdateService {

    def boolean update(Candidate candidate){
        if(!candidate.checkVersion(candidate.currentVersion)){
            log.info("BAD VERSION: " + candidate.version + "vs" + candidate.currentVersion)

            return false
        }
        if (!candidate.save(deepvalidate:true)) {
            log.info("CandidateService.SAVE")
            if(candidate.hasErrors()){
                candidate.errors.each {
                    log.info "CANDIDATE UPDATE FIELDERRORS: " + it
                }
            }
            return false
        }
        return true
    }

    def boolean delete(String candidateId){
        def candidate = Candidate.get(candidateId)
        if (!candidate) {
            return false
        }
        candidate.active = false
        if (!candidate.save(deepvalidate: true)) {
            return false
        }
        return true
    }

}
