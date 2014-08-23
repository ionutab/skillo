package skillo

import grails.transaction.Transactional
import skillo.activity.Activity
import skillo.activity.FieldChange
import skillo.candidate.Candidate
import skillo.candidate.CandidateQualification
import skillo.enums.ActivityType
import skillo.enums.DomainActivityType
import skillo.enums.Operation
import skillo.util.ActivityLoggingUtil

import java.text.SimpleDateFormat

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


        Activity activity = new Activity()
        activity.ownerId=candidate.id
        activity.type=type
        activity.modifiedObjectName=candidate.getFullName()
        activity.consultantName=consultant.getFullName()

        // for activities with type update, save the activity only if field changes are detected
        if(ActivityType.UPDATE==type){
                detectCandidateChanges(activity,candidate)
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
    def detectCandidateChanges(Activity activity, Candidate candidate) {

        if (candidate == null) {
            return
        }


        if (candidate.isDirty()) {
            for (String property : candidate.dirtyPropertyNames) {
                if (!property.equals("currentVersion")) {
                    FieldChange fieldChange = new FieldChange()
                    fieldChange.fieldName = property
                    fieldChange.valueFrom = ActivityLoggingUtil.activityLoggingFormatter(candidate.getPersistentValue(property))
                    fieldChange.valueTo = ActivityLoggingUtil.activityLoggingFormatter(candidate.getProperty(property))
                    fieldChange.activity = activity
                    // log domain activity type CANDIDATE for field change activity
                    fieldChange.domainActivityType = DomainActivityType.CANDIDATE
                    activity.domainActivityType=DomainActivityType.CANDIDATE
                    activity.save()
                    fieldChange.save()
                }

            }
        }

        if (candidate.address != null) {

            if (candidate.address.isDirty()) {
                Address candidateAddress = candidate.address
                for (String property : candidateAddress.dirtyPropertyNames) {
                    if (!property.equals("version")) {
                        FieldChange fieldChange = new FieldChange()
                        fieldChange.fieldName = property
                        fieldChange.valueFrom = ActivityLoggingUtil.activityLoggingFormatter(candidateAddress.getPersistentValue(property))
                        fieldChange.valueTo = ActivityLoggingUtil.activityLoggingFormatter(candidateAddress.getProperty(property))
                        fieldChange.activity = activity
                        // log domain activity type ADDRESS for field change activity
                        fieldChange.domainActivityType = DomainActivityType.ADDRESS
                        activity.domainActivityType=DomainActivityType.ADDRESS
                        activity.save()
                        fieldChange.save()
                    }
                }
            }
        }



        if (candidate.payroll != null) {

            if (candidate.payroll.isDirty()) {
                Payroll payroll = candidate.payroll
                for (String property : payroll.dirtyPropertyNames) {
                    if (!property.equals("version")) {
                        FieldChange fieldChange = new FieldChange()
                        fieldChange.fieldName = property
                        fieldChange.valueFrom = ActivityLoggingUtil.activityLoggingFormatter(payroll.getPersistentValue(property))
                        fieldChange.valueTo = ActivityLoggingUtil.activityLoggingFormatter(payroll.getProperty(property))
                        fieldChange.activity = activity
                        // log domain activity type PAYROLL for field change activity
                        fieldChange.domainActivityType = DomainActivityType.PAYROLL
                        activity.domainActivityType=DomainActivityType.PAYROLL
                        activity.save()
                        fieldChange.save()
                    }
                }
            }
        }


    }

    def logDocumentsActivity(ActivityType type, Consultant consultant, Candidate candidate, List<String> documents){

        if(documents==null || documents.isEmpty()){
            return
        }

        Activity activity = new Activity()
        activity.ownerId=candidate.id
        activity.type=type
        activity.modifiedObjectName=candidate.getFullName()
        activity.consultantName=consultant.getFullName()


        for(String doc:documents){
            FieldChange fieldChange = new FieldChange()
            fieldChange.activity=activity
            fieldChange.fieldName="document"
            fieldChange.valueFrom='null'
            fieldChange.valueTo = doc
            // log domain activity type DOCUMENT for field change activity
            fieldChange.domainActivityType=DomainActivityType.DOCUMENT
            activity.domainActivityType=DomainActivityType.DOCUMENT
            activity.save()
            fieldChange.save()
        }


    }

    def logCandidateQualificationActivity(ActivityType type, Consultant consultant, Candidate candidate, CandidateQualification qualification, Operation operation) {

        if (candidate == null) {
            return
        }

        Activity activity = new Activity()
        activity.ownerId = candidate.id
        activity.type = type
        activity.modifiedObjectName = candidate.getFullName()
        activity.consultantName = consultant.getFullName()

        if (qualification != null) {
            if (operation == Operation.UPDATE) {
                if (qualification.isDirty()) {
                    for (String property : qualification.dirtyPropertyNames) {
                        if (!property.equals("version")) {
                            FieldChange fieldChange = new FieldChange()
                            fieldChange.fieldName = property
                            fieldChange.valueFrom = ActivityLoggingUtil.activityLoggingFormatter(qualification.getPersistentValue(property))
                            fieldChange.valueTo = ActivityLoggingUtil.activityLoggingFormatter(qualification.getProperty(property))
                            fieldChange.activity = activity
                            // log domain activity type QUALIFICATION for field change activity
                            fieldChange.domainActivityType = DomainActivityType.CANDIDATE_QUALIFICATION
                            activity.domainActivityType = DomainActivityType.CANDIDATE_QUALIFICATION
                            activity.save()
                            fieldChange.save()
                        }
                    }
                }
            } else if (operation == Operation.DELETE) {
                FieldChange fieldChange = new FieldChange()
                fieldChange.fieldName = "qualification"
                fieldChange.valueFrom = qualification.qualification.name
                fieldChange.valueTo = 'null'
                fieldChange.activity = activity
                // log domain activity type QUALIFICATION for field change activity
                fieldChange.domainActivityType = DomainActivityType.CANDIDATE_QUALIFICATION
                activity.domainActivityType = DomainActivityType.CANDIDATE_QUALIFICATION
                activity.save()
                fieldChange.save()
            } else if (operation == Operation.ADD) {
                FieldChange fieldChange = new FieldChange()
                fieldChange.fieldName = "qualification"
                fieldChange.valueFrom = 'null'
                fieldChange.valueTo = qualification.qualification.name
                fieldChange.activity = activity
                // log domain activity type QUALIFICATION for field change activity
                fieldChange.domainActivityType = DomainActivityType.CANDIDATE_QUALIFICATION
                activity.domainActivityType = DomainActivityType.CANDIDATE_QUALIFICATION
                activity.save()
                fieldChange.save()
            }
        }


    }



    def getCandidateActivities(Long candidateId){

        def c = Activity.createCriteria()
        def result = c.list (){

            eq("ownerId", candidateId)
            order("timestamp", "desc")
        }

        return result
    }

    def getAllActivities(){
        def c = Activity.createCriteria()
        def result = c.list (){

            order("timestamp", "desc")
        }

        return result
    }



}
