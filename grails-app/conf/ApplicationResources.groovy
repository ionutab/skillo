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
}