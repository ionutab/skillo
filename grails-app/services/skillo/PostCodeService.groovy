package skillo

/**
 * PostCodeService
 * A service class encapsulates the core business logic of a Grails application
 */
class PostCodeService {

    static transactional = true

    def listPostCodes(){
        log.info("PCS.getAllPostCode")

        return PostCode.list()
    }

    def findPostCodesStartingWith(String code){
        log.info("PCS.getPostCodesStartingWith")
        log.info("PCS search code " + code)

        if(code == null || code.trim().size() == 0){
            return null
        }

        def postCodes = PostCode.findAllByCodeIlike(code.toUpperCase() + "%")

        if(postCodes != null){
            log.info("Post Codes Found " + postCodes.size())
        }

        return postCodes
    }

    def findPostCodesByRegion(String code){
        log.info("PCS.getPostCodesByRegion")



        return PostCode.list()
    }

    def findPostCodesAroundLocation(latitude, longitude, radius){
        log.info("PCS.getPostCodesAroundLocation")



        return PostCode.list()
    }

    def findPostCodesByCode(String code){
        log.info("PCS.findPostCodesByCode")

        if(code == null || code.trim().size() == 0){
            return null
        }

        def postCode = PostCode.findByCode(code.toUpperCase())

        log.info("Post Code found " + (postCode != null ? postCode.code : null))

        return postCode
    }

    def Boolean isValidCode(String code){
        if(code == null || code.trim().size() == 0){
            return false
        }

        if(code.length() > 10){
            return false
        }

        return true
    }

}
