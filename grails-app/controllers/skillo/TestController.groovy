package skillo

/**
 * TestController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class TestController extends BaseController {

    static scaffold = false

    def clientService

    def fff(){


        def testS = params['doc[]']
        ArrayList<Long> testI = new ArrayList<>()

        for (t in testS){
            testI.add(Long.parseLong ( t ) )
        }

        log.info("TL: " + testI)
/*



*/


    }

}
