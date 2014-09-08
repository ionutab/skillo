package skillo.candidate.search

import skillo.BaseController
import skillo.candidate.Candidate

class CandidateSearchController extends BaseController {

    def candidateSearchService

    def index(){
        log.info("INDEX")

        render(view: "/candidate/search/search")
    }

    def search(){
        log.info("SEARCH")



        render(view: "/candidate/search/search", model:[candidateList:Candidate.list()])
    }

}
