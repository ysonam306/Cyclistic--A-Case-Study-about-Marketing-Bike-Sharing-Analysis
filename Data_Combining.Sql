-- Data Combining by using UNION ALL
DROP TABLE IF EXISTS `2023_tripdata.combined_data`;

-- Combining all the 12 months data tables into a single table containing data from Jan 2023 to Dec 2023.

CREATE TABLE IF NOT EXISTS `2023_tripdata.combined_data` AS (
  SELECT * FROM `2023_tripdata.jan_tripdata`
  UNION ALL
  SELECT * FROM `2023_tripdata.feb_tripdata`
  UNION ALL
  SELECT * FROM `2023_tripdata.mar_tripdata`
  UNION ALL
  SELECT * FROM `2023_tripdata.apr_tripdata`
  UNION ALL
  SELECT * FROM `2023_tripdata.may_tripdata`
  UNION ALL
  SELECT * FROM `2023_tripdata.jun_tripdata`
  UNION ALL
  SELECT * FROM `2023_tripdata.jul_tripdata`
  UNION ALL
  SELECT * FROM `2023_tripdata.aug_tripdata`
  UNION ALL
  SELECT * FROM `2023_tripdata.sep_tripdata`
  UNION ALL
  SELECT * FROM `2023_tripdata.oct_tripdata`
  UNION ALL
  SELECT * FROM `2023_tripdata.nov_tripdata`
  UNION ALL
  SELECT * FROM `2023_tripdata.dec_tripdata`
);

-- Checking number of rows
SELECT COUNT(*)
FROM `2023_tripdata.combined_data`;

-- Total number of rows are 5719877

