package skillo

import grails.converters.JSON

/**
 * CountryController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class CountryController {

    static scaffold = false

    def getNationalitiesByName(){
        def nationality = request.getParameter("inputCode")
        def nationalityList
        if(nationality != null && nationality.size() > 0){
            nationalityList = Country.findAllByNationalityIlike("${nationality}%")
        } else {
            nationalityList = Country.list()
        }

        render( nationalityList as grails.converters.JSON )
        return
    }
}
