package skillo.candidate.search

import skillo.BaseController
import skillo.candidate.Candidate

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
        log.info("SEARCH")

        log.info("PARAMS" + params);

        def candidates = candidateSearchService.search()

        render(view: "/candidate/search/search", model:[candidateList:Candidate.list()])
    }

    def displayQualificationSetWidget(){
        log.info("GET NEW SEARCH WIDGET")
        log.info("PARAMS" + params);
        render(view: "/candidate/search/_qualificationSetWidget")
    }

}
