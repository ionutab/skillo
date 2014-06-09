modules = {
    application {
        resource url:'js/application.js'
    }

    bootstrap_dummy { resource url: [plugin: 'twitter-bootstrap', dir: 'less', file: 'bootstrap.less'], attrs:[rel: "stylesheet/less", type:'css'] }

    bootstrap_custom {
        dependsOn 'bootstrap'
        resource url: 'less/custom-bootstrap.less', attrs:[rel: "stylesheet/less", type:'css']
    }

    admin_light {
        dependsOn 'bootstrap', 'jquery', 'font-awesome'
        resource url:'css/admin_light.css'
        resource url:'css/custombox.css'
        resource url:'js/sidebar.js'
    }

    admin_light_simple {
        dependsOn 'bootstrap_custom', 'jquery', 'font-awesome'
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
        resource url:'select2-3.4.5/select2.css'
        resource url:'select2-3.4.5/select2-bootstrap.css'
        resource url:'select2-3.4.5/select2.js'
	}

    bs_switch {
        resource url:'css/bootstrap-switch/bootstrap-switch.css'
        resource url:'js/bootstrap-switch/bootstrap-switch.js'

    }

    datepicker {
        resource url:'js/eternicode-datepicker/bootstrap-datepicker.js'
        resource url:'css/datepicker.css'
    }

    forms {
        dependsOn 'select2,datepicker,bs_switch'
    }
}