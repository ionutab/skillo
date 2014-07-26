package skillo

import net.sf.ehcache.search.aggregator.Count

/**
 * CountryController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class CountryController {

    static scaffold = false

    def getNationality(){
        def nationality = request.getParameter("nationality")
        print("@@@@@@@@@@@@@@@@@@@ "+nationality)
        if(nationality != null){
            def nationalityList = Country.findAllByNationalityIlike("${nationality}%")
            print("BBBBBBBBBB "+nationalityList)
            render( nationalityList as grails.converters.JSON )
        }
        return
    }
}
