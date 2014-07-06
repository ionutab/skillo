modules = {

    /**
     * twitter bootstrap basic
     */
    'bootstrap-alert' {
        resource id: 'bootstrap-alert', url:'bootstrap/js/alert.js'
    }

    'bootstrap-affix' {
        resource id: 'bootstrap-affix', url:'bootstrap/js/affix.js'
    }

    'bootstrap-dropdown' {
        resource id: 'bootstrap-dropdown', url:'bootstrap/js/dropdown.js'
    }

    'bootstrap-modal' {
        resource id: 'bootstrap-modal', url:'bootstrap/js/modal.js'
    }

    'bootstrap-popover' {
        resource id: 'bootstrap-popover', url:'bootstrap/js/popover.js'
    }

    'bootstrap-scrollspy' {
        resource id: 'bootstrap-scrollspy', url:'bootstrap/js/scrollspy.js'
    }

    'bootstrap-tab' {
        resource id: 'bootstrap-tab', url: 'bootstrap/js/tab.js'
    }

    'bootstrap-tooltip' {
        resource id: 'bootstrap-tooltip', url:'bootstrap/js/tooltip.js'
    }

    'bootstrap-button' {
        resource id: 'bootstrap-button', url:'bootstrap/js/button.js'
    }

    'bootstrap-carousel' {
        resource id: 'bootstrap-carousel', url:'bootstrap/js/carousel.js'
    }

    'bootstrap-collapse' {
        resource id: 'bootstrap-collapse', url:'bootstrap/js/collapse.js'
    }

    'bootstrap-transition' {
        resource id: 'bootstrap-transition', url:'bootstrap/js/transition.js'
    }

    'bootstrap-js' {
        dependsOn 'bootstrap-transition,bootstrap-alert,bootstrap-dropdown,bootstrap-modal,bootstrap-scrollspy,bootstrap-tab,bootstrap-tooltip,bootstrap-popover,bootstrap-button,bootstrap-carousel,bootstrap-collapse,bootstrap-affix'
    }

    'bootstrap-less' {
        resource url: 'bootstrap/less/bootstrap.less', attrs: [rel: "stylesheet/less", type: 'css']
    }

    bootstrap {
        dependsOn 'bootstrap-less, bootstrap-js'
    }

    /**
     * font awesome basic
     */
    font_awesome {
        resource url: 'font-awesome/less/font-awesome.less', attrs: [rel: "stylesheet/less",type: 'css']
    }

    iCheck {
        resource url: 'adminLTE/js/plugins/iCheck/icheck.min.js'
        resource url: 'adminLTE/css/iCheck/all.css'
    }

    inputMask {
        resource url: 'adminLTE/js/input-mask/jquery.inputmask.js'
        resource url: 'adminLTE/js/input-mask/jquery.inputmask.date.extensions.js'
        resource url: 'adminLTE/js/input-mask/jquery.inputmask.extensions.js'
    }
    /**
     * admin lte bootstrap basic
     */
    admin_lte_less {
        resource url: 'adminLTE/less/AdminLTE.less', attrs:[rel: "stylesheet/less", type: 'css']
    }
    admin_lte_js {
        resource url: 'adminLTE/js/app.js'
    }
    admin_lte {
        dependsOn 'admin_lte_less,admin_lte_js'
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
        resource url:'select2/select2.css'
        resource url:'select2/select2-bootstrap.css'
        resource url:'select2/select2.js'
	}

    forms {
        dependsOn 'select2,datepicker,bs_switch'
    }

    application {
        resource url:'js/application.js'
    }

    /**
     * application COMPLETE LAYOUTS
     */
    admin_light {
        dependsOn 'bootstrap','jquery'
        resource url:'css/admin_light.css'
        resource url:'css/custombox.css'
    }

    skillo_admin_lte {
        dependsOn 'bootstrap','admin_lte','jquery','font_awesome','iCheck', 'inputMask'
    }

    skillo_admin_lte_basic {
        dependsOn 'bootstrap','admin_lte','font_awesome'
    }

}