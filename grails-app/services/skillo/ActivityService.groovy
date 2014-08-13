package skillo

import grails.transaction.Transactional
import skillo.activity.Activity
import skillo.activity.CandidateActivity
import skillo.activity.CandidateFieldChange
import skillo.candidate.Candidate
import skillo.enums.ActivityType

/**
 * ActivityService
 * A service class encapsulates the core business logic of a Grails application
 */
@Transactional
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
        Activity baseActivity = new Activity()
        baseActivity.type=type
        baseActivity.timestamp=new Date()
        activity.activity=baseActivity
        activity.candidate=candidate
        activity.candidateName=candidate.getFullName()
        activity.consultant=consultant
        activity.consultantName=consultant.getFullName()

        // for activities with type update, save the activity only if field changes are detected
        if(ActivityType.UPDATE==type){
            if(activity.save()){
                detectCandidateChanges(activity,candidate)
            }
        }else{
            // for other CREATE and DELETE types save it anyway. No field change detection is required
            activity.save()
        }

        return activity;

    }

    def  logPayrollActivity(ActivityType type, Consultant consultant, Candidate candidate, Payroll payroll){


        CandidateActivity activity = new CandidateActivity()
        Activity baseActivity = new Activity()
        baseActivity.type=type
        baseActivity.timestamp=new Date()
        activity.activity=baseActivity
        activity.candidate=candidate
        activity.candidateName=candidate.getFullName()
        activity.consultant=consultant
        activity.consultantName=consultant.getFullName()

        // for activities with type update, save the activity only if field changes are detected
        if(ActivityType.UPDATE==type){
            if(activity.save()){
                detectPayrollChanges(activity,payroll)
            }
        }else{
            // for other CREATE and DELETE types save it anyway. No field change detection is required
            activity.save()
        }

        return activity;

    }

    /**
     * Detect field changes on a candidate
     *
     * @param oldCandidate
     * @param candidate
     */
    def detectCandidateChanges(CandidateActivity activity, Candidate candidate) {

        if (candidate == null) {
            return
        }

        if (candidate.isDirty()) {
            for (String property : candidate.dirtyPropertyNames) {
                if (!property.equals("currentVersion")) {
                    CandidateFieldChange fieldChange = new CandidateFieldChange()
                    fieldChange.fieldName=property
                    fieldChange.valueFrom = candidate.getPersistentValue(property).toString()
                    fieldChange.valueTo = candidate.getProperty(property).toString()
                    fieldChange.activity=activity
                    fieldChange.save()
                }

            }
        }
    }

    def detectPayrollChanges(CandidateActivity activity, Payroll payroll) {

        if (payroll == null) {
            return
        }

        if (payroll.isDirty()) {
            for (String property : payroll.dirtyPropertyNames) {
                if (!property.equals("currentVersion")) {
                    CandidateFieldChange fieldChange = new CandidateFieldChange()
                    fieldChange.fieldName=property
                    fieldChange.valueFrom = payroll.getPersistentValue(property).toString()
                    fieldChange.valueTo = payroll.getProperty(property).toString()
                    fieldChange.activity=activity
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

    def getAllActivities(){
        def c = CandidateActivity.createCriteria()
        def result = c.list (){

            order("timestamp", "desc")
        }

        return result
    }


}
