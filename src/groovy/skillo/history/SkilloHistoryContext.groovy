package skillo.history

import org.codehaus.groovy.grails.commons.DomainClassArtefactHandler

/**
 * Created with IntelliJ IDEA.
 * User: ionutab
 * Date: 11/12/13
 * Time: 2:36 AM
 * To change this template use File | Settings | File Templates.
 */
public class SkilloHistoryContext {

    void insertHistory(DomainModelEvent insertEvent){

        insertEvent.setEventDetails( " added by " + insertEvent.getConsultant().getFirstName() + " " + insertEvent.getConsultant().getLastName() )

        if(DomainClassArtefactHandler.isDomainClass(insertEvent.getClass())){
            insertEvent.save()
        }
    }

}
