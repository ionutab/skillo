package skillo

class CandidateQualificationController {

    def scaffold = true

    def index() {
        redirect(action: "list")
    }

    def addCandidateQualification() {

        def newCandidateQualification = new CandidateQualification(params["newCandidateQualification"])

        log.info(params["newCandidateQualification"] as grails.converters.JSON)

        if (params["newCandidateQualification.expiryDate"]) {
            params["newCandidateQualification.expiryDate"] = new Date(params["newCandidateQualification.expiryDate"])
            newCandidateQualification.expiryDate = params["newCandidateQualification.expiryDate"]
        }

        newCandidateQualification.setActive(Boolean.TRUE)

        if(newCandidateQualification.expiryDate == null){
            newCandidateQualification.expiryDate = new Date()
        }

        if(Boolean.TRUE == newCandidateQualification.getIsMainTrade()){
            def candidateQualifications = CandidateQualification.findAllByCandidate(candidate)
            candidateQualifications.each { candidateQualification ->
                //put the other qualifications to not be main trade
                candidateQualification.setIsMainTrade(Boolean.FALSE)
                candidateQualification.save()
            }
        }

        newCandidateQualification.clearErrors()
        if(!newCandidateQualification.save(deepvalidate:true,flush: true)){

            newCandidateQualification.candidate = Candidate.get(newCandidateQualification.candidate.id)
            newCandidateQualification.candidate.errors.reject("asfdsdfsdfsdfsdf")
            redirect(controller: "candidate", action: "edit", id: newCandidateQualification.candidate.id )
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'candidate.label', default: 'CandidateQualification'), candidate.firstName + " " + candidate.lastName])
        redirect(controller: "candidate", action: "edit", id: newCandidateQualification.candidate.id )
        return
    }

}
