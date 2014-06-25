package skillo

/**
 * TestController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class TestController extends BaseController {

    static scaffold = false

    def clientService

    def testSearchClients(){
        log.info("TC:Search Clients")
        Client c = new Client()

        clientService.search(c)
    }

}
