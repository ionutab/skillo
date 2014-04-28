package skillo

/**
 * PostCodeService
 * A service class encapsulates the core business logic of a Grails application
 */
class PostCodeService {

    static transactional = true

    def listPostCodes(){
        log.info("PCS.listPostCodes")
        return PostCode.list()
    }

}
