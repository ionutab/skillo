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

    def index(){
        log.info("INDEX")

        render(view: "/candidate/search/search")
    }

    def search(){
        log.info("SEARCH ")
        log.info(params)

        ArrayList<String> inputQualificationSets = new ArrayList<String>()
        ArrayList<HashMap<Long,String>> qualificationSets

        if(session['qualificationSets']){
            qualificationSets = session['qualificationSets']
        } else {
            qualificationSets = new ArrayList<HashMap<Long, String>>()
        }

        if(params.advancedSearch) {
            inputQualificationSets = params.advancedSearch.list('qualifications')
            qualificationSets = Select2InputUtils.splitSelect2MultipleArrayToHashMap(inputQualificationSets)
            filter.qualifications = Select2InputUtils.getIdsFromHashMapArray(qualificationSets)
        }

        Collection<Candidate> candidateList = candidateSearchService.search(filter)

        for(Candidate cl : candidateList){
            log.info("@@@@@@@@@@@@@@@  " + cl.toString())
        }

        session['qualificationSets'] = qualificationSets
        render(view: "/candidate/search/search", model:[candidateFilter:filter, qualificationSets:qualificationSets as grails.converters.JSON, candidateList:candidateList])
    }

    def displayQualificationSetWidget(){
        log.info("GET NEW SEARCH WIDGET")
        render(view: "/candidate/search/_qualificationSetWidget")
    }

}
