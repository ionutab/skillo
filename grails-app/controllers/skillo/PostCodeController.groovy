package skillo

import grails.converters.JSON

class PostCodeController {

    def scaffold = true

    def index() {
        redirect(action: "list")
    }

    def getPostCodes(){
        def inputCode = request.getParameter("inputCode")
        if(inputCode != null){
            def postCodeList = PostCode.findAllByCodeIlike("${inputCode}%")
            render( postCodeList as grails.converters.JSON )
        }
        return
    }

    def getPostCodeById(){
        def inputId = request.getParameter("inputId")
        if(inputId != null){
            def postCode = PostCode.get(inputId)
            render ( postCode as grails.converters.JSON )
        }
        return
    }
}
