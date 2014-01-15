package skillo

import grails.converters.JSON

class PostCodeController {

    def scaffold = true

    def index() {
        redirect(action: "list")
    }

    def getPostCodes(){
        log.info("3 " + request.getParameter("inputCode"))

        def inputCode = request.getParameter("inputCode")
        if(inputCode != null){
            def postCodeList = PostCode.findAllByCodeIlike("${inputCode}%")
            log.info("size : " + postCodeList.size())
            log.info(postCodeList as grails.converters.JSON)
            render( postCodeList as grails.converters.JSON )
        }
        return
    }

    def getPostCodeById(){
        log.info("3id " + request.getParameter("inputId"))
        def inputId = request.getParameter("inputId")
        if(inputId != null){
            def postCode = PostCode.get(inputId)
            render ( postCode as grails.converters.JSON )
        }
        return
    }
}
