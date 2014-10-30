import grails.validation.ValidationErrors

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

        "500"(controller: "errors", action: "handlingErrors",
                exception: IllegalArgumentException)
        "500"(controller: "errors", action: "handlingErrors",
                exception: NullPointerException)
        "500"(controller: "errors", action: "handlingErrors",
                exception: ValidationErrors)

	}
}
