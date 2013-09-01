modules = {
    application {
        resource url:'js/application.js'
    }

	admin {
		dependsOn 'bootstrap', 'jquery', 'font-awesome'
		resource url:'css/admin.css'
		resource url:'css/custombox.css'
	}
	
	maps {
		resource url:'css/maps/googlemaps.css'
		resource url:'js/maps/googlemaps.js'
	}
	
	candidates {
		resource url:'js/candidates-list.js'
		resource url:'js/candidates-form.js'
	}

	select2 {
        resource url:'js/select2/select2.js'
        resource url:'css/select2/select2.css'
        resource url:'css/select2/select2-bootstrap.css'
	}

    datepicker {
        resource url:'js/bootstrap-datepicker.js'
        resource url:'css/datepicker.css'
    }

    forms {
        dependsOn 'select2,datepicker'
    }
}