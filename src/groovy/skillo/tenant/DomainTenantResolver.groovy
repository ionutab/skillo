package skillo.tenant

import grails.plugin.multitenant.core.resolve.TenantResolver
import grails.plugin.multitenant.core.exception.TenantResolveException
import org.slf4j.Logger
import org.slf4j.LoggerFactory

import javax.servlet.http.HttpServletRequest
import java.util.regex.Pattern

/**
 * TODO: Implement me!
 *
 * @see http://multi-tenant.github.com/grails-multi-tenant-single-db/
 */
class DomainTenantResolver implements TenantResolver {

    final static Integer DEFAULT_ID = 0; //localhost
    static Pattern SUBDOMAIN_PATTERN = ~/^[^\.]+/


    Integer resolve(HttpServletRequest request) throws TenantResolveException {
        String subdomain = extractSubdomain(request.getServerName())

        def id = null

        if(subdomain) {
            id = TenantMeta.findBySubdomain(subdomain)?.id
        }

        request.getSession().setAttribute("tenantId", id ?: DEFAULT_ID)

        id ?: DEFAULT_ID

    }

    static String extractSubdomain(String domain) {
        def m = domain =~ SUBDOMAIN_PATTERN;
        m ? m[0][1] : false
    }
}
