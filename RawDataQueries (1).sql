#Raw data Queries


-- total records
-- 24648499
SELECT COUNT(*) "Count" FROM raw_yellow_tripdata;


-- observe NULL values
-- 809568
SELECT vendorid, COUNT(*) "Count"
FROM  raw_yellow_tripdata
GROUP BY vendorid
ORDER BY 1;

-- observe other categories
SELECT pulocationid, COUNT(*) "Count"
FROM   raw_yellow_tripdata
GROUP BY pulocationid
ORDER BY 1;

-- observe NULL values
-- 809568
SELECT payment_type, COUNT(*) "Count"
FROM   raw_yellow_tripdata
GROUP BY payment_type
ORDER BY 1;

-- observe other columns with NULL values
-- passenger_count, ratecodeid, store_and_fwd_flag, payment_type
SELECT * 
FROM   raw_yellow_tripdata
WHERE  vendorid IS NULL
LIMIT 100;

-- tpep_pickup_datetime is defined as STRING
-- observe record counts that falls outside of the time period 
SELECT SUBSTR(tpep_pickup_datetime, 1, 7) "Period", COUNT(*) "Total Records"
FROM   raw_yellow_tripdata
GROUP BY SUBSTR(tpep_pickup_datetime, 1, 7) 
ORDER BY 1;


-- records with incorrect pickup datetime values
-- 280
SELECT COUNT(*) "Count"
FROM   raw_yellow_tripdata 
WHERE  SUBSTR(tpep_pickup_datetime, 1, 7) NOT LIKE '2020%';

-- Records with NULL categories like Vendor ID
-- 809568
SELECT COUNT(*) "Count"
FROM   raw_yellow_tripdata
WHERE  vendorid IS NULL
AND    SUBSTR(tpep_pickup_datetime, 1, 7) LIKE '2020%';

-- Total records in BER months, excluding columns with missing Vendor ID
-- 4347658
SELECT COUNT(*) "Count"
FROM   raw_yellow_tripdata
WHERE  vendorid IS NOT NULL
AND    SUBSTR(tpep_pickup_datetime, 1, 7) LIKE '2020-1%';

-- explore data with lookup information
-- observe column names from lookup tables
SELECT td.*, pu.*, do.*
FROM   raw_yellow_tripdata td, 
       taxi_zone_lookup pu, 
       taxi_zone_lookup do 
WHERE  td.pulocationid = pu.locationid AND
       td.pulocationid = do.locationid AND
       vendorid IS NOT NULL AND
       SUBSTR(tpep_pickup_datetime, 1, 7) LIKE '2020-1%'
LIMIT 100;

-- Count total joined records for the last quarter of 2020.
-- 4347658
SELECT COUNT(*) "Count"
FROM   raw_yellow_tripdata td, 
       taxi_zone_lookup pu, 
       taxi_zone_lookup do 
WHERE  td.pulocationid = pu.locationid AND
       td.pulocationid = do.locationid AND
       vendorid IS NOT NULL AND
       SUBSTR(tpep_pickup_datetime, 1, 7) LIKE '2020-1%';