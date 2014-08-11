package skillo.util

import org.joda.time.DateTime

import java.text.SimpleDateFormat
import java.util.concurrent.TimeUnit

/**
 * Created by Andrei-PC on 8/10/2014.
 */
class ActivityLoggingUtil {

    def static logActivityTimestamp(Date timestamp){
      Date now = new Date();
      long diff = now.getTime()-timestamp.getTime();
      long minutes =  TimeUnit.MILLISECONDS.toMinutes(diff);
      if(minutes<1){
         return "seconds ago"
      }else{
          SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm")
          return dateFormat.format(timestamp)
      }
    }
}
