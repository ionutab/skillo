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

    void "test Get Post Codes Starting With"(){

        def testCode = "AB10 1AA"

        def allPostCodes = service.findPostCodesStartingWith(testCode)

        println "postCodes do not exist " + (allPostCodes == null)

        if(allPostCodes != null){
            println "postCodes size " + allPostCodes.size()
        }

        assert true
    }

    void "test Get Post Codes List"() {
        def allPostCodes = service.listPostCodes()

        println "postCodes do not exist " + (allPostCodes == null)

        if(allPostCodes != null){
            println "postCodes size " + allPostCodes.size()
        }

        assert true
    }

    void "test Get Post Codes List 2"() {
        def allPostCodes = service.listPostCodes()

        println "postCodes do not exist " + (allPostCodes == null)

        if(allPostCodes != null){
            println "postCodes size " + allPostCodes.size()
        }

        assert true
    }

    void "test Get Post Code By Code "(){

        def testCode = "AB10 1AA"

        def postCode = service.findPostCodesByCode(testCode)

        println "Post Code found " + (postCode != null ? postCode.code : null)

        assert postCode != null
    }

}
