package skillo.tenant

import grails.plugin.multitenant.core.resolve.TenantResolver
import grails.plugin.multitenant.core.exception.TenantResolveException
import org.slf4j.Logger
import org.slf4j.LoggerFactory

import javax.servlet.http.HttpServletRequest

/**
 * TODO: Implement me!
 *
 * @see http://multi-tenant.github.com/grails-multi-tenant-single-db/
 */
class DomainTenantResolver implements TenantResolver {

    private static final Logger log = LoggerFactory.getLogger(this)


    Integer resolve(HttpServletRequest request) throws TenantResolveException {
        String host = request.getServerName()
        String tenant = null


        if(host.equals("localhost")){
            tenant = "localhost"
        }else{
            String domain = grails.util.Metadata.current.'app.domain'
            tenant = host.substring(0,host.indexOf("."+domain))
        }
        TenantMeta tenantMeta = TenantMeta.findByTenantName(tenant);

       if(tenantMeta!=null){
           return tenantMeta.tenantId()
       }

       return 0 //localhost
    }
}
