package skillo.candidate.search

import skillo.BaseController
import skillo.candidate.Candidate
import skillo.filters.CandidateFilter

/**
 * CandidateSearchController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class CandidateSearchController extends BaseController{

    def candidateSearchService

    def index(){
        log.info("INDEX")

        render(view: "/candidate/search/search")
    }

    def search(){
        log.info("SEARCH ")
        CandidateFilter filter = new CandidateFilter()

        Collection<String> qualificationSets = new ArrayList<String>();
        if(params.advancedSearch) {
            qualificationSets = (Collection<String>)params.advancedSearch.qualifications

            filter.qualifications = splitAdvancedSearchArray(qualificationSets)
            log.info(filter.toString())
        }

        render(view: "/candidate/search/search", model:[candidateList:Candidate.list()])
    }

    def displayQualificationSetWidget(){
        log.info("GET NEW SEARCH WIDGET")
        render(view: "/candidate/search/_qualificationSetWidget")
    }

    /**
     *
     * @param inputArray
     * @return
     */
    def Collection<Collection<Long>> splitAdvancedSearchArray(ArrayList<String> inputArray){

        Collection<Collection<Long>> ret = new ArrayList<ArrayList<Long>>()

        for (String unexploded : inputArray){
            ArrayList<String> valS =Arrays.asList(unexploded.split(","));
            ArrayList<Long> val = new ArrayList<Long>()

            for(String id: valS){
                val.add(Long.parseLong(id))
            }

            ret.add(val)
        }

        return ret
    }

}
