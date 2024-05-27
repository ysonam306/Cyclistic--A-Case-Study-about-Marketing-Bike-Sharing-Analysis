-- Data Exploration

-- Checking the data types of all columns

SELECT
 column_name,
 data_type
FROM `2023_tripdata`.INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'combined_data';

-- Checking for number of null values in all columns

SELECT
  COUNTIF(ride_id IS NULL) AS ride_id,
  COUNTIF(rideable_type IS NULL) AS rideable_type,
  COUNTIF(started_at IS NULL) AS started_at,
  COUNTIF(ended_at IS NULL) AS ended_at,
  COUNTIF(start_station_name IS NULL) AS start_station_name,
  COUNTIF(start_station_id IS NULL) AS start_station_id,
  COUNTIF(end_station_name IS NULL) AS end_station_name,
  COUNTIF(end_station_id IS NULL) AS end_station_id,
  COUNTIF(start_lat IS NULL) AS start_lat,
  COUNTIF(start_lng IS NULL) AS start_lng,
  COUNTIF(end_lat IS NULL) AS end_lat,
  COUNTIF(end_lng IS NULL) AS end_lng,
  COUNTIF(member_casual IS NULL) AS member_casual
FROM
  `2023_tripdata.combined_data`;


-- Checking for duplicate rows

SELECT COUNT(ride_id)-COUNT(DISTINCT ride_id) AS duplicate_rows
FROM `2023_tripdata.combined_data`;

-- Checking for 'ride_id' charracters length

SELECT LENGTH(ride_id) AS length_ride_id, COUNT(ride_id) AS number_of_rows
FROM `2023_tripdata.combined_data`
GROUP BY length_ride_id;
-- 'ride_id' column have a character length of 16

-- Checking for 'rideable_type' - 3 unique types of bikes

SELECT DISTINCT(rideable_type), COUNT(rideable_type) AS number_of_trips
From `2023_tripdata.combined_data`
GROUP BY rideable_type;

-- Checking for 'started_at', 'ended_at' - TIMESTAMP - YYYY-MM-DD hh:mm:ss UTC

SELECT started_at, ended_at
FROM `2023_tripdata.combined_data`
LIMIT 10;

-- To count events where the duration between start_time and end_time is longer than a day

SELECT COUNT(*) AS longer_than_a_day
FROM `2023_tripdata.combined_data`
WHERE
  TIMESTAMP_DIFF(ended_at, started_at, MINUTE) > 1440;
-- 1day=24 hours, 1 hour=60 minutes so minutes in a day= 24*60=1440
-- TIMESTAMP_DIFF(end_time, start_time, MINUTE): Calculates the difference between end_time and start_time in minutes.
-- longer_than_a_day = 6417

-- To count events where the duration between start_time and end_time is less than a minute

SELECT COUNT(*) AS less_than_a_minute
FROM `2023_tripdata.combined_data`
WHERE
  TIMESTAMP_DIFF(ended_at, started_at, MINUTE) < 1;
-- TIMESTAMP_DIFF(end_time, start_time, MINUTE): Calculates the difference between end_time and start_time in minutes.
-- less than a minute = 149615


-- Checking start_station_name, start_station_id -rows with missing or null values in both

SELECT DISTINCT start_station_name
FROM `2023_tripdata.combined_data`
ORDER BY start_station_name;

SELECT COUNT(ride_id) AS rows_with_start_station_null
FROM `2023_tripdata.combined_data`
WHERE start_station_name IS NULL OR start_station_id IS NULL;   -- rows with start statin null is 875848

-- Checking end_station_name, end_station_id -rows with missing or null values in both

SELECT DISTINCT end_station_name
FROM `2023_tripdata.combined_data`
ORDER BY end_station_name;

SELECT COUNT(ride_id) AS rows_with_end_station_null
FROM `2023_tripdata.combined_data`
WHERE end_station_name IS NULL OR end_station_id IS NULL;   -- rows with end statin null is 929343

-- Checking end_lat, end_lng -rows with missing or null values in both

SELECT COUNT(ride_id) AS rows_with_end_loc_null
FROM `2023_tripdata.combined_data`
WHERE end_lat IS NULL OR end_lng IS NULL;   -- rows with end location null is 6990


-- Checking member_casual - 2 unique values - member and casual riders

SELECT DISTINCT member_casual, COUNT(member_casual) AS no_of_trips
FROM `2023_tripdata.combined_data`
GROUP BY member_casual;
