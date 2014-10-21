package skillo.candidate.search

import org.codehaus.groovy.grails.validation.Validateable
import skillo.BaseController
import skillo.Select2InputUtils
import skillo.candidate.Candidate
import skillo.filters.CandidateFilter

/**
 * CandidateSearchController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class CandidateSearchController extends BaseController{

    static scope = "session"

    def candidateSearchService

    def CandidateFilter filter = new CandidateFilter()

    static defaultAction = "search"

    def search(){
        log.info("SEARCH ")
        log.info(params)

        ArrayList<String> inputQualificationSets = new ArrayList<String>()
        ArrayList<HashMap<Long,String>> qualificationSets = new ArrayList<>()
        ArrayList<String> inputOperators = new ArrayList<>()

        if(session['candidateFilter']){
            filter = session['candidateFilter']
        } else {
            filter = new CandidateFilter()
        }

        if(params.advancedSearch) {
            inputQualificationSets = params.advancedSearch.list('qualifications')
            inputOperators = (ArrayList<String>)params.advancedSearch.list('operators')
            qualificationSets = Select2InputUtils.splitSelect2MultipleArrayToHashMap(inputQualificationSets)

            filter.isRegistered = params.advancedSearch['isRegistered']
            filter.isInducted = params.advancedSearch['isInducted']
            filter.isSponsored = params.advancedSearch['isSponsored']
            filter.isDriver = params.advancedSearch['isDriver']
            filter.isCarOwner = params.advancedSearch['isCarOwner']
        }

        filter.qualifications = qualificationSets
        filter.translateIntoQualificationIds()
        filter.operators = inputOperators

        Collection<Candidate> candidateList = candidateSearchService.search(filter)

        session['candidateFilter'] = filter
        render(view: "/candidate/search/search", model:[candidateFilter:filter, qualificationSets:filter.qualifications as grails.converters.JSON, candidateList:candidateList])
    }

    def reset(){
        log.info("RESET")

        session['qualificationSets'] = new ArrayList<HashMap<Long, String>>()
        render(view: "/candidate/search/search", model:[candidateFilter:new CandidateFilter(), qualificationSets:session['qualificationSets'], candidateList:null])
    }

    def displayQualificationSetWidget(){
        log.info("GET NEW SEARCH WIDGET")
        render(view: "/candidate/search/_qualificationSetWidget")
    }

}
