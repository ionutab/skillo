
CREATE TABLE `skillo`.`post_code_temp` (
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
) ENGINE=InnoDB CHARSET=latin1;

-- be sure to replace file location to server file location
LOAD DATA LOCAL INFILE 'C:/s/short.csv'
INTO TABLE SKILLO.POST_CODE_TEMP
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(postcode,latitude,longitude,easting,northing,grind_ref,county,district,ward,district_code,ward_code,country,country_code);

LOAD DATA LOCAL INFILE 'C:/s/postcodes.csv'
INTO TABLE SKILLO.POST_CODE_TEMP
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



update post_code set grind_ref = null where length(grind_ref) = 0 and grind_ref is not null;
update post_code set district = null where length(district) = 0 and district is not null;
update post_code set ward = null where length(ward) = 0 and ward is not null;
update post_code set district_code = null where length(district_code) = 0 and district_code is not null;
update post_code set ward_code = null where length(ward_code) = 0 and ward_code is not null;
update post_code set county = null where length(county) = 0 and county is not null;
update post_code set country = null where length(country) = 0 and country is not null;
update post_code set country_code = null where length(country_code) = 0 and country_code is not null;