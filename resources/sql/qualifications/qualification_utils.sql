CREATE TABLE `skillo`.`qualification_temp` (
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOAD DATA LOCAL INFILE 'C:/s/basic_qualification_list.csv'
INTO TABLE SKILLO_MAIN.QUALIFICATION_TEMP
FIELDS TERMINATED BY ','
ENCLOSED BY ''
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(name,description,code)
;

INSERT INTO qualification (code, name, description, can_be_main_trade, version)
  SELECT
    code,
    name,
    description,
    1 as can_be_main_trade,
    0 AS version
  FROM qualification_temp;