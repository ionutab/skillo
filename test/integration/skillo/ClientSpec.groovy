package skillo

import grails.test.mixin.TestFor
import skillo.client.Client

@TestFor(Client)
class ClientSpec {

    void "test something"() {
        log.warn("1234")
        assert true
    }
}
