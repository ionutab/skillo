package skillo.tenant

import grails.plugin.multitenant.core.Tenant

/**
 * TODO: Implement me!
 *
 * @see http://multi-tenant.github.com/grails-multi-tenant-single-db/
 */
class TenantMeta implements Tenant {

    // unique identifier used to extract data that belongs to a specific client
    Integer tenantID
    // the unique identified tenant name (e.g. bcm)
    String subdomain
    // the client web page (e.g. bcm.skillo.co.uk)
    String domain
    // the client full name (e.g. BCM Resourcing)
    String name

    static constraints = {
        tenantID  blank: false, unique: true
        subdomain blank: false, unique: true
        domain blank: false, unique: true
    }

    Integer tenantId() {
        tenantID
    }
}
