package skillo.history

import skillo.Consultant

/**
 * Created with IntelliJ IDEA.
 * User: ionutab
 * Date: 11/17/13
 * Time: 5:04 PM
 * To change this template use File | Settings | File Templates.
 */
public interface SkilloDomainModelWithHistory extends GroovyObject {

    def skilloHistoryContext = new SkilloHistoryContext()

    public void addInsertEvent( )

    public void addInsertEvent(Consultant consultant)

    public void addUpdateEvent( )

    public void addUpdateEvent(Consultant consultant)


}