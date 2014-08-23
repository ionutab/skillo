package skillo.util


import java.text.SimpleDateFormat
import java.util.concurrent.TimeUnit

/**
 * Created by Andrei-PC on 8/10/2014.
 */
class ActivityLoggingUtil {

    private static final SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");

    def static logActivityTimestamp(Date timestamp) {
        Date now = new Date();
        long diff = now.getTime() - timestamp.getTime();
        long minutes = TimeUnit.MILLISECONDS.toMinutes(diff);
        if (minutes < 1) {
            return "seconds ago"
        } else {
            SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm")
            return dateFormat.format(timestamp)
        }
    }

    def static activityLoggingFormatter(Object ob) {

        if (ob instanceof java.sql.Timestamp) {
            Date date = new Date(((java.sql.Timestamp) ob).time)
            return dateFormat.format(date)
        } else if (ob instanceof Date) {
            return dateFormat.format(ob)
        } else if (ob instanceof Boolean) {
            if(ob){
                return "Yes"
            }else{
                return "No"
            }
        } else {
            return ob.toString()
        }

    }
}
