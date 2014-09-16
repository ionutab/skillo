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


        def candidates = candidateSearchService.search()

        render(view: "/candidate/search/search", model:[candidateList:candidates])
    }

}
