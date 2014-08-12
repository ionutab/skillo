package skillo.candidate

import grails.transaction.Transactional


/**
 * Created by ionutab on 8/12/2014.
 */
@Transactional
class CandidateNoteService {

    def boolean save(CandidateNote candidateNote, Long candidateId){
        if(!candidateNote || !candidateId){
            return false
        }

        Candidate candidate = Candidate.get(candidateId)
        candidateNote.candidate = candidate

        return save(candidateNote)
    }

    def boolean save(CandidateNote candidateNote){

        if(!candidateNote){
            return false
        }

        candidateNote.note.date = new Date()

        if(candidateNote.save(deepvalidate:true, flush: true)){
            return true
        } else {

            if(candidateNote.hasErrors()){
                candidateNote.errors.each {
                    println "fielderrors: " + it
                }
            }
            return false
        }
    }


}
