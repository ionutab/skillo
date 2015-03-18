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

        if(session["candidateSearchFilter"]){
            filter = session["candidateSearchFilter"]
        } else {
            filter = new CandidateFilter()
            filter.qualifications = qualificationSets
            filter.operators = inputOperators
        }

        if(params.advancedSearch) {
            inputQualificationSets = params.advancedSearch.list('qualifications')
            inputOperators = (ArrayList<String>)params.advancedSearch.list('operators')
            qualificationSets = Select2InputUtils.splitSelect2MultipleArrayToHashMap(inputQualificationSets)

            filter.qualifications = qualificationSets
            filter.translateIntoQualificationIds()
            filter.operators = inputOperators

            filter.isRegistered = params.advancedSearch['isRegistered']
            filter.isInducted = params.advancedSearch['isInducted']
            filter.isSponsored = params.advancedSearch['isSponsored']
            filter.isDriver = params.advancedSearch['isDriver']
            filter.isCarOwner = params.advancedSearch['isCarOwner']
        }

        Collection<Candidate> candidateList = candidateSearchService.search(filter, 3, 1000 )
        Candidate firstCandidate = candidateList.size() > 0 ? candidateList.first() : null

        session["candidateSearchFilter"] = filter
        render(view: "/candidate/search/candidateSearch", model:[candidateFilter:filter, qualificationSets:filter.qualifications as grails.converters.JSON, candidateList:candidateList,  candidateTotal: candidateList.totalCount, candidateShow: firstCandidate])
    }

    def reset(){
        log.info("RESET")
        params.advancedSearch = null
        session['candidateSearchFilter'] = null
        return search()
    }

    def displayQualificationSetWidget(){
        log.info("GET NEW SEARCH WIDGET")
        render(view: "/candidate/search/_qualificationSetWidget")
    }

}
