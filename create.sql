
DROP DATABASE IF EXISTS india_trade;
CREATE DATABASE india_trade;

USE india_trade;

DROP TABLE IF EXISTS export;
CREATE TABLE export(
hscode INT,
commodity TEXT,
value FLOAT(60),
country VARCHAR(100),
year YEAR(4)
);
					
DROP TABLE IF EXISTS import;
CREATE TABLE import(
hscode INT,
commodity TEXT,
value FLOAT(60),
country VARCHAR(60),
year YEAR(4)
);

SHOW VARIABLES LIKE "secure_file_priv";

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/india-trade-data/2018-2010_export.csv'
INTO TABLE export
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(hscode, commodity, value, country, year)
SET value = nullif(@value,'');

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/india-trade-data/2018-2010_import.csv'
INTO TABLE import
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(hscode, commodity, value, country, year)
SET value = nullif(@value,'');

SELECT * FROM export
LIMIT 100;