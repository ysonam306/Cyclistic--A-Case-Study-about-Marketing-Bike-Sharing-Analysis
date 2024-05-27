-- Data Cleaning

DROP TABLE IF EXISTS `2023_tripdata.cleaned_combined_data`;

-- Creating new table with clean data

CREATE TABLE IF NOT EXISTS `2023_tripdata.cleaned_combined_data` AS (
  SELECT                       -- Alias (a and b): Used for brevity and clarity in the query.
    a.ride_id, rideable_type, started_at, ended_at,ride_length,
    CASE EXTRACT(DAYOFWEEK FROM started_at) 
      WHEN 1 THEN 'SUNDAY'
      WHEN 2 THEN 'MONDAY'
      WHEN 3 THEN 'TUESDAY'
      WHEN 4 THEN 'WEDNESDAY'
      WHEN 5 THEN 'THURSDAY'
      WHEN 6 THEN 'FRIDAY'
      WHEN 7 THEN 'SATURDAY'    
    END AS day_of_week,
    CASE EXTRACT(MONTH FROM started_at)
      WHEN 1 THEN 'JAN'
      WHEN 2 THEN 'FEB'
      WHEN 3 THEN 'MAR'
      WHEN 4 THEN 'APR'
      WHEN 5 THEN 'MAY'
      WHEN 6 THEN 'JUN'
      WHEN 7 THEN 'JUL'
      WHEN 8 THEN 'AUG'
      WHEN 9 THEN 'SEP'
      WHEN 10 THEN 'OCT'
      WHEN 11 THEN 'NOV'
      WHEN 12 THEN 'DEC'
    END AS month,
    start_station_name,end_station_name,
    start_lat,start_lng,end_lat,end_lng,member_casual
  FROM `2023_tripdata.combined_data` a
  JOIN (                          -- INNER JOIN: Returns only the records that have matching values in both tables.
    SELECT ride_id,(
    TIMESTAMP_DIFF(ended_at, started_at,MINUTE)) AS ride_length
  FROM `2023_tripdata.combined_data`) b
  ON a.ride_id = b.ride_id
  WHERE
    start_station_name IS NOT NULL AND
    end_station_name IS NOT NULL AND
    end_lat IS NOT NULL AND
    end_lng IS NOT NULL AND
    ride_length > 1 AND ride_length < 1440  -- removing less than a minute and longer than a day rows
);


-- set ride_id as primary key
ALTER TABLE `2023_tripdata.cleaned_combined_data`
ADD PRIMARY KEY(ride_id) NOT ENFORCED;   


SELECT COUNT(ride_id) AS no_of_rows       -- returned 41,68,500 rows so 15,51,377 rows removed
FROM `2023_tripdata.cleaned_combined_data`;

