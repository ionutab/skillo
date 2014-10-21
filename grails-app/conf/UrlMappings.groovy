class UrlMappings {

	static mappings = {
		
		/* 
		 * Pages without controller 
		 */
		"/"				    (controller: "home", action: "list")
		"/about"		    (view:"/info/about")
		"/contact"		    (view:"/info/contact")
		"/terms"		    (view:"/info/terms")
        "/map"              (view:"/home/map")

        name candidateSearch: "/candidateSearch" {
            controller = 'candidateSearch'
            action = 'search'
        }

		"/$controller/$action?/$id?"{
			constraints {

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
