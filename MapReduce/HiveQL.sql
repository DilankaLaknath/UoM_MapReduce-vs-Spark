-- Create an external table to load data from S3 bucket
CREATE EXTERNAL TABLE IF NOT EXISTS delay_flights (
  ID INT,
  Year INT,
  Month INT,
  DayOfMonth INT,
  DayOfWeek INT,
  DepTime INT,
  CRSDepTime INT,
  ArrTime INT,
  CRSArrTime INT,
  UniqueCarrier STRING,
  FlightNum INT,
  TailNum STRING,
  ActualElapsedTime INT,
  CRSElapsedTime INT,
  AirTime INT,
  ArrDelay INT,
  DepDelay INT,
  Origin STRING,
  Dest STRING,
  Distance INT,
  TaxiIn INT,
  TaxiOut INT,
  Cancelled INT,
  CancellationCode STRING,
  Diverted INT,
  CarrierDelay INT,
  WeatherDelay INT,
  NASDelay INT,
  SecurityDelay INT,
  LateAircraftDelay INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION 's3://assignment-dilanka/dataset/';

-- Query to find year-wise carrier delay from 2003-2010
SELECT Year, AVG((CarrierDelay / ArrDelay) * 100) AS avg_carrier_delay
FROM delay_flights
WHERE Year BETWEEN 2003 AND 2010 AND CarrierDelay IS NOT NULL AND ArrDelay IS NOT NULL
GROUP BY Year
ORDER BY Year;

-- Query to find year-wise NAS delay from 2003-2010
SELECT Year, AVG((NASDelay / ArrDelay) * 100) AS avg_nas_delay
FROM delay_flights
WHERE Year BETWEEN 2003 AND 2010 AND NASDelay IS NOT NULL AND ArrDelay IS NOT NULL
GROUP BY Year
ORDER BY Year;

-- Query to find year-wise Weather delay from 2003-2010
SELECT Year, AVG((WeatherDelay / ArrDelay) * 100) AS avg_weather_delay
FROM delay_flights
WHERE Year BETWEEN 2003 AND 2010 AND WeatherDelay IS NOT NULL AND ArrDelay IS NOT NULL
GROUP BY Year
ORDER BY Year;

-- Query to find year-wise late aircraft delay from 2003-2010
SELECT Year, AVG((LateAircraftDelay / ArrDelay) * 100) AS avg_late_air_craft_delay
FROM delay_flights
WHERE Year BETWEEN 2003 AND 2010 AND LateAircraftDelay IS NOT NULL AND ArrDelay IS NOT NULL
GROUP BY Year
ORDER BY Year;

-- Query to find year-wise security delay from 2003-2010
SELECT Year, AVG((SecurityDelay / ArrDelay) * 100) AS avg_security_delay
FROM delay_flights
WHERE Year BETWEEN 2003 AND 2010 AND SecurityDelay IS NOT NULL AND ArrDelay IS NOT NULL
GROUP BY Year
ORDER BY Year;