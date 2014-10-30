package skillo.errors

import org.slf4j.Logger
import org.slf4j.LoggerFactory

/**
 * ErrorsController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class ErrorsController {

    private static final Logger log = LoggerFactory.getLogger(this)

    def handlingErrors(){

        def exception = request.exception
        def tenantId = session['tenantId']

        log.error "[Tenant - $tenantId ] exception in $exception.className,  line $exception.lineNumber has throw $exception.cause"

        render(view: "serverError")
    }



}
