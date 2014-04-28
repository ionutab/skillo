package skillo.service

import grails.test.mixin.*
import skillo.PostCode
import skillo.PostCodeService

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(PostCodeService)
@Mock(PostCode)
class PostCodeServiceSpec {

    void "test Get Post Code List"() {
        def allPostCodes = service.listPostCodes()

        println "postCodes do not exist " + (allPostCodes == null)

        if(allPostCodes != null){
            println "postCodes size " + allPostCodes.size()
        }

        assert true
    }

}
