package skillo

import grails.converters.JSON

class PostCodeController {

    def scaffold = false

    def index() {
        redirect(action: "list")
    }

    def getPostCodesByName(){
        def inputCode = request.getParameter("inputCode")
        if(inputCode != null){
            def postCodeList
            if(inputCode.trim().size() <= 5){
                postCodeList = PostCode.findAllByCodeIlike("${inputCode}%",[max:inputCode.trim().size() * 5])
            } else {
                postCodeList = PostCode.findAllByCodeIlike("${inputCode}%")
            }
            render( postCodeList as grails.converters.JSON )
        }
        return
    }

    def getPostCodeById(){
        def inputId = request.getParameter("inputId")
        if( inputId != null ){
            def postCode = PostCode.get( inputId )
            render ( postCode as grails.converters.JSON )
        }
        return
    }
}
