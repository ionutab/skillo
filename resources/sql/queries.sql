INSERT INTO qualification (code, name, description, can_be_main_trade, version) SELECT code, name, description, 1 as can_be_main_trade, 0 AS version FROM qualification_temp;
INSERT INTO post_code (version, code, latitude, longitude, easting, northing, grind_ref, county, district, ward, district_code, ward_code, country, country_code) SELECT   0 AS version, postcode, latitude, longitude, easting, northing, grind_ref, county, district, ward, district_code, ward_code, country,country_code FROM post_code_temp;
update qualification set code = null where length(code) = 0 and code is not null;
update qualification set description = null where length(description) = 0 and description is not null;
update post_code set grind_ref = null where length(grind_ref) = 0 and grind_ref is not null;
update post_code set district = null where length(district) = 0 and district is not null;
update post_code set ward = null where length(ward) = 0 and ward is not null;
update post_code set district_code = null where length(district_code) = 0 and district_code is not null;
update post_code set ward_code = null where length(ward_code) = 0 and ward_code is not null;
update post_code set county = null where length(county) = 0 and county is not null;
update post_code set country = null where length(country) = 0 and country is not null;
update post_code set country_code = null where length(country_code) = 0 and country_code is not null;



# insert into payroll_company(name,version) values('ICM',0);
# insert into payroll_company(name,version) values('GUILD',0);
insert into payroll_company(name,version) values('FOSRE',0);

