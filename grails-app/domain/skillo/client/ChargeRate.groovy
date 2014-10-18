package skillo.client

import grails.plugin.multitenant.core.annotation.MultiTenant
import skillo.Qualification

/**
 * Created by ionutab on 9/7/2014.
 */
@MultiTenant
class ChargeRate {

    static Qualification qualification
    static BigDecimal rate

    Date dateCreated
    Date lastUpdated

    static belongsTo = [client:Client]

    static constraints = {
    }

    static mapping = {
        autoTimestamp true
    }

}
