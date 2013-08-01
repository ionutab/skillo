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
	
	candidates {
		dependsOn 'bootstrap'
		resource url:'js/candidates-list.js'
		resource url:'js/candidates-form.js'
	}
}