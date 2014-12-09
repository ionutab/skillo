package skillo.util.search

import skillo.PostCode

/**
 * Calculator used to compute the distance between two points
 *
 * Created by andrei on 04.12.2014.
 */
class DistanceCalculatorUtil {

     static final double R = 3961; //radius of the earth in miles

    /**
     * Compute distance in between two postcodes based on latitude and longitude using Haversine formula
     *
     * http://en.wikipedia.org/wiki/Haversine_formula
     *
     * @param start
     *          the start location of the road
     * @param end
     *          the end location of the road
     */

    def static haversine(lat1, lon1, lat2, lon2) {

        def dLat = Math.toRadians(lat2 - lat1)
        def dLon = Math.toRadians(lon2 - lon1)
        lat1 = Math.toRadians(lat1)
        lat2 = Math.toRadians(lat2)

        def a = Math.sin(dLat / 2) * Math.sin(dLat / 2) + Math.sin(dLon / 2) * Math.sin(dLon / 2) * Math.cos(lat1) * Math.cos(lat2)
        def c = 2 * Math.asin(Math.sqrt(a))
        R * c
    }
}
