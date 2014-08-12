package skillo

import skillo.activity.Activity
import skillo.activity.FieldChange
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


        Activity activity = new Activity()
        activity.type=type
        activity.domainModelId=candidate.id
        activity.name=candidate.getFullName()
        activity.consultantId=consultant.id
        activity.consultantName=consultant.getFullName()
        activity.timestamp = new Date()

        // for activities with type update, save the activity only if field changes are detected
        if(ActivityType.UPDATE==type){
            if(detectChanges(activity,candidate)){
                activity.save()
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
    def detectChanges(Activity activity, Object obj) {

        boolean isChanged =false;

        if (obj == null) {
            return false
        }

        if (obj.isDirty()) {
            for (String property : obj.dirtyPropertyNames) {
                if (!property.equals("currentVersion")) {
                    FieldChange fieldChange = new FieldChange()
                    fieldChange.from = obj.getPersistentValue(property)
                    fieldChange.to = obj.getProperty(property)
                    activity.changes.put(property,fieldChange)
                    isChanged=true;
                }

            }
        }
        return isChanged
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
