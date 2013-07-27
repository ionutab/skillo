modules = {
    application {
        resource url:'js/application.js'
    }

	admin {
		dependsOn 'bootstrap'
		resource url:'css/admin.css'
	}
	
	maps {
		dependsOn 'bootstrap'
		resource url:'css/maps/googlemaps.css'
			resource url:'js/maps/googlemaps.js'
	}
}