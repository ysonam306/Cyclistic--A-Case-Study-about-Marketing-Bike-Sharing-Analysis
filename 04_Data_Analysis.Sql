-- Data Analysis

-- Checking the bike types used by riders

SELECT
  member_casual, rideable_type, COUNT(*) AS total_trips
FROM `2023_tripdata.cleaned_combined_data`
GROUP BY member_casual, rideable_type
ORDER BY member_casual, total_trips;

-- Checking the number of trips per month

SELECT
  month, member_casual, COUNT(ride_id) AS total_trips
FROM `2023_tripdata.cleaned_combined_data`
GROUP BY month, member_casual
ORDER BY member_casual;

-- Checking the number of trips per day of week

SELECT
  day_of_week, member_casual, COUNT(ride_id) AS total_trips
FROM `2023_tripdata.cleaned_combined_data`
GROUP BY day_of_week, member_casual
ORDER BY member_casual;

-- Checking the number of trips per hour

SELECT 
  EXTRACT(HOUR FROM started_at) AS hour_of_day, member_casual, COUNT(ride_id) AS total_trips
FROM `2023_tripdata.cleaned_combined_data`
GROUP BY hour_of_day, member_casual
ORDER BY member_casual;

-- Checking for the average ride_length per month

SELECT 
  month, member_casual, AVG(ride_length) AS avg_ride_duration
FROM `2023_tripdata.cleaned_combined_data`
GROUP BY month, member_casual;

-- Checking for the average ride_length per day of week

SELECT 
  day_of_week, member_casual, AVG(ride_length) AS avg_ride_duration
FROM `2023_tripdata.cleaned_combined_data`
GROUP BY day_of_week, member_casual;

-- Checking for the average ride_length per hour

SELECT 
  EXTRACT(HOUR FROM started_at) AS hour_of_day, member_casual, AVG(ride_length) AS avg_ride_duration
FROM `2023_tripdata.cleaned_combined_data`
GROUP BY hour_of_day, member_casual;

-- Checking for the mostly used starting station locations by members and casual riders

SELECT
  start_station_name, member_casual,
  AVG(start_lat) AS start_lat, AVG(start_lng) AS start_lng,
  COUNT(ride_id) AS toatl_trips
FROM `2023_tripdata.cleaned_combined_data`
GROUP BY start_station_name, member_casual;

-- Checking for the mostly used ending station locations by members and casual riders 

SELECT
  end_station_name, member_casual,
  AVG(end_lat) AS end_lat, AVG(end_lng) AS end_lng,
  COUNT(ride_id) AS toatl_trips
FROM `2023_tripdata.cleaned_combined_data`
GROUP BY end_station_name, member_casual;

