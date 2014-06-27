package skillo

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

    static belongsTo = Address

    static mapping = {
        code index: 'pc_code_idx'
    }

	static constraints = {
        code unique: true, blank: false, minSize: 4

        //this is for test purposes only
        latitude nullable: true
        longitude nullable: true
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
    }

    def beforeInsert(){
        log.info("before insert making")
        this.make()
    }

    def beforeUpdate(){
        log.info("before update making")
        this.make()
    }

    @Override
    void make() {
        //To change body of implemented methods use File | Settings | File Templates.
        log.info("making PostCode")
    }

}
