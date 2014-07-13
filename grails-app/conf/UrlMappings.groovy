class UrlMappings {

	static mappings = {
		
		/* 
		 * Pages without controller 
		 */
		"/"				(view:"/home/dashboard")
		"/about"		(view:"/info/about")
		"/contact"		(view:"/info/contact")
		"/terms"		(view:"/info/terms")
        "/map"          (view:"/home/map")
        "/testDashboard"         (view:"/testDashboard")
        "/testEC"         (view:"/testEC")
        "/testCL"       (view:"/testCL")
        "/testCP"       (view:"/testCP")

		/* 
		 * Pages with controller
		 * WARN: No domain/controller should be named "api" or "mobile" or "web"!
		 */
		"/$controller/$action?/$id?"{
			constraints {
				controller(matches:/^((?!(api|mobile|web)).*)$/)
		  	}
		}
		
		/* 
		 * System Pages without controller 
		 */
		"403"	(view:'/_errors/403')
		"404"	(view:'/_errors/404')
		"500"	(view:'/_errors/error')
		"503"	(view:'/_errors/503')
	}
}
