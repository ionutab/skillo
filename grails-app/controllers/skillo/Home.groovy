package skillo

/**
 * DashboardController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class Home {

    static scaffold = true

    def list(){
        print("################################ called")
        def activities = Activity.listOrderByTimestamp(offset:10, max:20)
        render(view: "/dashboard", model: [ Activity: activities])
    }

}
