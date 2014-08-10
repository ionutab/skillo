package skillo

import skillo.enums.ActivityType

/**
 * ActivityService
 * A service class encapsulates the core business logic of a Grails application
 */
class ActivityService {

    /**
     * Log change activity for a candidate
     *
     * @param type
     * @param consultantId
     * @param oldCandidate
     * @param newCandidate
     * @return
     */
    def  logCandidateActivity(ActivityType type, Consultant consultant, Candidate oldCandidate, Candidate newCandidate){


        Activity activity = new Activity()
        activity.type=type
        activity.domainModelId=newCandidate.id
        activity.name=newCandidate.getFullName()
        activity.consultantId=consultant.id
        activity.consultantName=consultant.getFullName()
        activity.timestamp = new Date()

        if(ActivityType.UPDATE==type){
            detectChanges(oldCandidate,newCandidate)
        }

        activity.save()

        return activity;

    }

    /**
     * Detect field changes on a object
     *
     * @param oldCandidate
     * @param newCandidate
     */
    def detectChanges(Candidate oldCandidate, Candidate newCandidate){

        if(oldCandidate==null || newCandidate==null){
            return
        }

    }

    def getActivities(Long domainModelId){

        def c = Activity.createCriteria()
        def result = c.list (){

            eq("domainModelId", domainModelId)
            order("timestamp", "desc")
        }

        return result
    }




}
