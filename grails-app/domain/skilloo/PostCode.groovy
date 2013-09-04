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

    static mapping = {
    }
    
	static constraints = {
        code minSize: 4
        code unique: true
        county nullable: true
        countryCode nullable: true

        //this is for test purposes only
        latitude nullable: true
        longitude nullable: true
        easting nullable: true
        northing nullable: true
        grindRef nullable: true
        district nullable: true
        ward nullable: true
        districtCode nullable: true
        wardCode nullable: true
        county nullable: true
        country nullable: true
        countryCode nullable: true
    }
}
