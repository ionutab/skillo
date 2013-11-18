package skillo.history

/**
 * Created with IntelliJ IDEA.
 * User: ionutab
 * Date: 11/17/13
 * Time: 5:16 PM
 * To change this template use File | Settings | File Templates.
 */
public interface DomainModelEvent {

    public setEventDetails(String eventDetails)

    public setEventDetails(DefaultHistoryEvent eventDetails)

    public DefaultHistoryEvent getEventDetails()

}