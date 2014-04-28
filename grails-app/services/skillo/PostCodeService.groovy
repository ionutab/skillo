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

    def getPostCodesByRegion(String code){
        log.info("PCS.getPostCodesByRegion")



        return PostCode.list()
    }

    def getPostCodesAroundLocation(latitude, longitude, radius){
        log.info("PCS.getPostCodesAroundLocation")



        return PostCode.list()
    }

}
