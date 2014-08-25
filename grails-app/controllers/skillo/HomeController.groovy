package skillo

import skillo.activity.Activity
import skillo.candidate.Candidate

/**
 * DashboardController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class HomeController {

    def activityService

    def list(){
        render(view: "/home/dashboard",model: [candidateInstanceTotal: Candidate.count(),candidateActivities:activityService.getAllActivities(),activityInstanceTotal: Activity.count()])
    }

    def filter = {
        params.max = Math.min(params.max ? params.int('max') : 3, 10)
        render(template: 'template/latestActivities', model: [candidateActivities:activityService.getAllActivities(), activityInstanceTotal: Activity.count()])
    }

}
