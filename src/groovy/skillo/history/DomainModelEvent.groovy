package skillo.history

import skillo.Consultant

/**
 * Created with IntelliJ IDEA.
 * User: ionutab
 * Date: 11/17/13
 * Time: 5:16 PM
 * To change this template use File | Settings | File Templates.
 */
public interface DomainModelEvent {

    public void setEventDetails(String eventDetails)

    public void setEventDetails(DefaultHistoryEvent eventDetails)

    public void setConsultant(Consultant consultant)

    public DefaultHistoryEvent getEventDetails()

}