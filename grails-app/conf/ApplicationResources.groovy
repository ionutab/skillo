modules = {
    application {
        resource url:'js/application.js'
    }

    admin_light {
        dependsOn 'bootstrap', 'jquery', 'font-awesome'
        resource url:'css/admin_light.css'
        resource url:'css/custombox.css'
        resource url:'js/sidebar.js'
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
        resource url:'css/select2/select2.css'
        resource url:'css/select2/select2-bootstrap.css'
        resource url:'js/select2-3.4.3/select2.js'
	}

    datepicker {
        resource url:'js/eternicode-datepicker/bootstrap-datepicker.js'
        resource url:'css/datepicker.css'
    }

    forms {
        dependsOn 'select2,datepicker'
    }
}