package skillo

class CandidateQualificationController {

    def scaffold = true

    def index() {
        redirect(action: "list")
    }

    def addCandidateQualification() {

        def newCandidateQualification = new CandidateQualification(params["newCandidateQualification"])

        if(params.get("candidateId") == null){
            redirect(controller: "candidate", action: "list")
            return
        }

        def candidate = Candidate.get(Long.parseLong    (params.get("candidateId").toString()))

        if(candidate == null){
            redirect(controller: "candidate", action: "list")
            return
        }

        if(params.get("newCandidateQualification.qualificationId") == null){
            return
        }

        def qualification = Qualification.get(Long.parseLong(params["newCandidateQualification"].qualificationId))

        if (params["newCandidateQualification.expiryDate"]) {
            params["newCandidateQualification.expiryDate"] = new Date(params["newCandidateQualification.expiryDate"])
            newCandidateQualification.expiryDate = params["newCandidateQualification.expiryDate"]
        }

        newCandidateQualification.setQualification(qualification)
        newCandidateQualification.setCandidate(candidate)
        newCandidateQualification.setActive(Boolean.TRUE)

        if(newCandidateQualification.expiryDate == null){
            newCandidateQualification.expiryDate = new Date()
        }

        candidate.candidateQualifications.add(newCandidateQualification)

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
//            redirect(controller: candidate, action: "edit", params: [candidateInstance: candidate, newCandidateQualification: newCandidateQualification])
        }

        redirect(controller: "candidate", action: "edit", id: candidate.id )
        return
    }

}
