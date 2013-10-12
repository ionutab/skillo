package skilloo

class PostCode {

    String code
    Double latitude
    Double longitude
    Long easting
    Long northing
    String grindRef
    String district
    String ward
    String districtCode
    String wardCode
    String county
    String country
    String countryCode

    static belongsTo = [address:Address]

	static constraints = {
        code unique: true, blank: false, minSize: 4

        //this is for test purposes only
        latitude nullable: true, blank: false
        longitude nullable: true, blank: false
        easting nullable: true
        northing nullable: true
        grindRef nullable: true, blank: false
        district nullable: true, blank: false
        ward nullable: true, blank: false
        districtCode nullable: true, blank: false
        wardCode nullable: true, blank: false
        county nullable: true, blank: false
        country nullable: true, blank: false
        countryCode nullable: true, blank: false

        address nullable: true
    }
}
