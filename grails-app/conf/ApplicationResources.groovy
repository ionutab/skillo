modules = {
    application {
        resource url:'js/application.js'
    }

	admin {
		dependsOn 'bootstrap'
		resource url:'css/admin.css'
		resource url:'css/custombox.css'
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

	select2 {
		dependsOn 'bootstrap'
        resource url:'js/select2/select2.js'
        resource url:'css/select2/select2.css'
        resource url:'css/select2/select2-bootstrap.css'
	}
}