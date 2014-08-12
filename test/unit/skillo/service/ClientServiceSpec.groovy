package skillo.service

import grails.test.mixin.*
import skillo.client.Client
import skillo.ClientService

@TestFor(ClientService)
@Mock(Client)
class ClientServiceSpec {

    void testSomething(){
        assert true
    }

    void "test Search Clients"(){

        service.search()

        assert true
    }

}
