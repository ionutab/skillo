package skillo.candidate

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import org.apache.log4j.ConsoleAppender
import org.apache.log4j.PropertyConfigurator
import skillo.candidate.search.CandidateSearchController
import spock.lang.Specification

@TestFor(CandidateSearchController)
@Mock(Candidate)
class CandidateControllerSpec extends Specification {

    void setUp() {
        String log4jConfPath = "test/log4j.properties";
        ConsoleAppender app = new ConsoleAppender()
        app.setName(this.class.getName())
        app.setTarget(ConsoleAppender.SYSTEM_OUT)

        Properties props = new Properties();
        props.load(new FileInputStream("test/log4j.properties"));
        PropertyConfigurator.configure(props);
    }

    void tearDown() {
        // Tear down logic here
    }

    void "test lallaa"() {
        given:
        def searchMock = mockFor(CandidateSearchService)
        controller.candidateSearchService = searchMock.createMock()

        when:
        controller.search()

        then:
        controller.response.text.contains "Found 2 results"
    }

}
