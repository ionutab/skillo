
CREATE TABLE `post_code_temp` (
  `postcode` varchar(255) NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `easting` bigint(20) DEFAULT NULL,
  `northing` bigint(20) DEFAULT NULL,
  `grind_ref` varchar(255) DEFAULT NULL,
  `county` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `ward` varchar(255) DEFAULT NULL,
  `district_code` varchar(255) DEFAULT NULL,
  `ward_code` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  UNIQUE KEY `postcode` (`postcode`)
) ENGINE=InnoDB;



LOAD DATA LOCAL INFILE 'C:/s/postcodes.csv'
INTO TABLE POST_CODE_TEMP
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(postcode,latitude,longitude,easting,northing,grind_ref,county,district,ward,district_code,ward_code,country,country_code);

INSERT INTO post_code (version, code, latitude, longitude, easting, northing, grind_ref, county, district, ward, district_code, ward_code, country, country_code)
  SELECT
    0 AS version,
    postcode,
    latitude,
    longitude,
    easting,
    northing,
    grind_ref,
    county,
    district,
    ward,
    district_code,
    ward_code,
    country,
    country_code
  FROM post_code_temp;

