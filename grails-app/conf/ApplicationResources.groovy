modules = {
    application {
        resource url:'js/application.js'
    }

    another {
        dependsOn 'bootstrap'
        resource url:'css/another.css'
    }
	
	test {
		dependsOn 'bootstrap'
		resource url:'css/test.css'
	}
	
	maps {
		dependsOn 'bootstrap'
		resource url:'css/maps/googlemaps.css'
			resource url:'js/maps/googlemaps.js'
	}
}