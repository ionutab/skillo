package skillo.candidate.search

import grails.test.mixin.TestFor
import skillo.candidate.Candidate
import skillo.candidate.CandidateSearchService
import spock.lang.Specification

/**
 * Test action controller rendering for {@link CandidateSearchController}
 */
@TestFor(CandidateSearchController)
class CandidateSearchControllerSpec extends Specification {

    void 'test index'() {
      when:
      controller.index()

      then:
      view == '/candidate/search/search'
    }

    void 'test search'() {

        given:
        def searchMock = mockFor(CandidateSearchService)
        searchMock.demand.search { List<Candidate> q -> [new Candidate(firstName: 'Candidate1'), new Candidate(firstName: 'Candidate2')] }
        searchMock.demand.static.logResults { List results ->  }
        controller.candidateSearchService = searchMock.createMock()

        when:
        controller.search()

        then:
        model.candidateList!=null
        view == '/candidate/search/search'
    }
}
