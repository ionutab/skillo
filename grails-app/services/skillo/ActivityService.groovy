package skillo

import skillo.activity.Activity
import skillo.activity.CandidateActivity
import skillo.activity.CandidateFieldChange
import skillo.candidate.Candidate
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
     * @param candidate
     * @return
     */
    def  logCandidateActivity(ActivityType type, Consultant consultant, Candidate candidate){


        CandidateActivity activity = new CandidateActivity()
        activity.type=type
        activity.candidate=candidate
        activity.consultant=consultant
        activity.timestamp = new Date()

        // for activities with type update, save the activity only if field changes are detected
        if(ActivityType.UPDATE==type){
            if(activity.save()){
                detectChanges(activity,candidate)
            }
        }else{
            // for other CREATE and DELETE types save it anyway. No field change detection is required
            activity.save()
        }

        return activity;

    }

    /**
     * Detect field changes on a object
     *
     * @param oldCandidate
     * @param candidate
     */
    def detectChanges(Activity activity, Candidate candidate) {

        if (candidate == null) {
            return
        }

        if (candidate.isDirty()) {
            for (String property : candidate.dirtyPropertyNames) {
                if (!property.equals("currentVersion")) {
                    CandidateFieldChange fieldChange = new CandidateFieldChange()
                    fieldChange.fieldName=property
                    fieldChange.from = candidate.getPersistentValue(property).toString()
                    fieldChange.to = candidate.getProperty(property).toString()
                    fieldChange.save()
                }

            }
        }
    }


    def getCandidateActivities(Long candidateId){

        def c = CandidateActivity.createCriteria()
        def result = c.list (){

            eq("candidate", Candidate.get(candidateId))
            order("timestamp", "desc")
        }

        return result
    }


}
