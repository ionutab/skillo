package skillo.candidate.search

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import skillo.BaseIntegrationSpec
import skillo.candidate.Candidate

/**
 * Test suite for {@link CandidateSearchController}
 */
@TestFor(CandidateSearchController)
@Mock([Candidate])
class CandidateSearchControllerIntegrationSpec extends BaseIntegrationSpec {

    //instantiate controller object
    def candidateSearchController
    def candidateSearchService

    def setup() {

        candidateSearchController  = new CandidateSearchController()
        candidateSearchController.candidateSearchService=this.candidateSearchService
    }


    void "test candidate search when no candidates exists in database"(){


        setup:
        //setup requiredQualifications
        candidateSearchController.params.qualifications=[]

        when:
        //execute
        def model = candidateSearchController.search()

        then:
         0==candidateSearchController.modelAndView.model.candidateList.size()
    }

    void "test candidate search  with active candidates in database"(){


        setup:
        Candidate candidate1  = new Candidate(firstName: "John", lastName: "Sephard", telephoneNumber: "00751-101-212",address: TEST_ADDRESS, birthDate: new Date(1976,5,21),carOwner: true,driver: true,sponsored: true, consultant: TEST_CONSULTANT,dateCreated: new Date(),lastUpdated: new Date(),candidateQualifications: TEST_CANDIDATE_QUALIFICATION)
        candidate1.save(flush: true)
        Candidate candidate2  = new Candidate(firstName: "John", lastName: "Doe", telephoneNumber: "00251-701-242",address: TEST_ADDRESS, birthDate: new Date(1971,2,26),carOwner: true,driver: true,sponsored: true, consultant: TEST_CONSULTANT,dateCreated: new Date(),lastUpdated: new Date(),candidateQualifications: TEST_CANDIDATE_QUALIFICATION)
        candidate2.save(flush: true)

        //setup requiredQualifications
        candidateSearchController.params.qualifications=[TEST_QUALIFICATION.id]

        when:
        //execute
        def model = candidateSearchController.search()

        then:
        2==candidateSearchController.modelAndView.model.candidateList.size()
    }

    void "test candidate search with one active and one inactive candidates in database"(){

        setup:
        Candidate candidate1  = new Candidate(firstName: "John", lastName: "Sephard", telephoneNumber: "00751-101-212",address: TEST_ADDRESS, birthDate: new Date(1976,5,21),carOwner: true,driver: true,sponsored: true, consultant: TEST_CONSULTANT,dateCreated: new Date(),lastUpdated: new Date(),candidateQualifications: TEST_CANDIDATE_QUALIFICATION)
        candidate1.active=false
        candidate1.save(flush: true)
        Candidate candidate2  = new Candidate(firstName: "John", lastName: "Doe", telephoneNumber: "00251-701-242",address: TEST_ADDRESS, birthDate: new Date(1971,2,26),carOwner: true,driver: true,sponsored: true, consultant: TEST_CONSULTANT,dateCreated: new Date(),lastUpdated: new Date(),candidateQualifications: TEST_CANDIDATE_QUALIFICATION)
        candidate2.save(flush: true)

        //setup requiredQualifications
        candidateSearchController.params.qualifications=[TEST_QUALIFICATION.id]

        when:
        //execute
        def model = candidateSearchController.search()

        then:
        1==candidateSearchController.modelAndView.model.candidateList.size()

    }

}
