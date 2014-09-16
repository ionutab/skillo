package skillo

import skillo.candidate.CandidateQualification
import skillo.user.User
import skillo.user.UserRole
import spock.lang.Specification

/**
 * Base class that should be extended by all integration tests.
 * Setup domain models that can be used in all integration tests.
 *
 * Created by Andrei-PC on 9/12/2014.
 */
class BaseIntegrationSpec extends Specification{


    /**
     * Test user used in integration tests
     */
    def TEST_USER

    /**
     * Test consultant used in integration tests
     */
    def TEST_CONSULTANT

    /**
     * Test address used in integration tests
     */
    def TEST_ADDRESS

    /**
     * Test qualification that can belongs to a candidate qualification in integration tests
     */
    def TEST_QUALIFICATION

    /**
     * Test qualification assigned to a candidate
     */
    def TEST_CANDIDATE_QUALIFICATION

    def setup() {



        //initialize the user
        Role role = new Role(authority: 'TEST_ROLE_USER').save(flush: true)
        User TEST_USER = new User(username: 'skillo_test', enabled: true, password: 'skillo')
        def springSecurityService = new Object()
        springSecurityService.metaClass.encodePassword = {String password -> "ENCODED_PASSWORD"}
        TEST_USER.springSecurityService = springSecurityService
        TEST_USER.save(flush: true)
        UserRole.create TEST_USER, role, true


        //initialize the consultant
        TEST_CONSULTANT = new Consultant(firstName: "John", lastName: "Sephard", email: "john.sephard@skillo.com",user: TEST_USER)
        TEST_CONSULTANT.save(flush: true)

        //initialize the address
        TEST_ADDRESS = new Address(details: "Shaftesbury Avenue")
        TEST_ADDRESS.save(flush: true)

        //initialize the qualification
        TEST_QUALIFICATION = new Qualification(name: "Crane Controller", canBeMainTrade: true)
        TEST_QUALIFICATION.save(flush: true)

        //initialize the candidate qualification
        TEST_CANDIDATE_QUALIFICATION =  new CandidateQualification(qualification: TEST_QUALIFICATION)


    }


}
