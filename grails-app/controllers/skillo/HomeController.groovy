package skillo

import skillo.activity.Activity
import skillo.activity.CandidateActivity

/**
 * DashboardController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class HomeController {

    def activityService

    def list(){
        def activities = activityService.getAllActivities()
        render(view: "/home/dashboard", model: [ candidateActivities: activities])
    }

}
