package skillo.candidate

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import org.apache.log4j.ConsoleAppender
import org.apache.log4j.PropertyConfigurator
import skillo.filters.CandidateFilter
import spock.lang.Specification

/**
 * Created by ionutab on 10/9/2014.
 */
@TestFor(CandidateSearchService)
@Mock(Candidate)
class CandidateSearchServiceSpec extends Specification{

    void "test Encourage Users are properly handled"() {
        given: "List of Users"
        String log4jConfPath = "test/log4j.properties";
        ConsoleAppender app = new ConsoleAppender()
        app.setName(this.class.getName())
        app.setTarget(ConsoleAppender.SYSTEM_OUT)

        Properties props = new Properties();
        props.load(new FileInputStream("test/log4j.properties"));
        PropertyConfigurator.configure(props);

        when: "service is called"
        //"service" represents the grails service you are testing for

        log.debug("gtfo")
        CandidateFilter f1 = new CandidateFilter()
        service.search(f1)

        then: "Expect something to happen"
        //Assertion goes here
    }
}
