#importing necessary libaries
from pyspark.sql import SparkSession

# create a SparkSession
spark = SparkSession.builder.appName("flight_delay_analysis").getOrCreate()

# create an external table to load data from S3 bucket
spark.sql("""
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
    LOCATION 's3://assignment-dilanka/dataset/'
""")

#Check if the temporary database exists
spark.catalog.listDatabases()

# Read the "delay_flights" table from the "delay_flights" database
df = spark.read.table("delay_flights")

# Show the first 3 rows of the DataFrame
df.show(3)

# Query to find year-wise carrier delay from 2003-2010
import time
start_time = time.time()
carrier_delay_df = spark.sql("SELECT Year, AVG((CarrierDelay / ArrDelay) * 100) AS avg_carrier_delay FROM delay_flights WHERE Year BETWEEN 2003 AND 2010 AND CarrierDelay IS NOT NULL AND ArrDelay IS NOT NULL GROUP BY Year ORDER BY Year").show()
end_time = time.time()
execution_time = end_time - start_time
print(f"Execution time: {execution_time} seconds")

# Query to find year-wise NAS delay from 2003-2010
import time
start_time = time.time()
nas_delay_df = spark.sql("SELECT Year, AVG((NASDelay / ArrDelay) * 100) AS avg_nas_delay FROM delay_flights WHERE Year BETWEEN 2003 AND 2010 AND NASDelay IS NOT NULL AND ArrDelay IS NOT NULL GROUP BY Year ORDER BY Year").show()
end_time = time.time()
execution_time = end_time - start_time
print(f"Execution time: {execution_time} seconds")

# Query to find year-wise Weather delay from 2003-2010
import time
start_time = time.time()
weather_delay_df = spark.sql("SELECT Year, AVG((WeatherDelay / ArrDelay) * 100) AS avg_weather_delay FROM delay_flights WHERE Year BETWEEN 2003 AND 2010 AND WeatherDelay IS NOT NULL AND ArrDelay IS NOT NULL GROUP BY Year ORDER BY Year").show()
end_time = time.time()
execution_time = end_time - start_time
print(f"Execution time: {execution_time} seconds")

# Query to find year-wise late aircraft delay from 2003-2010
import time
start_time = time.time()
late_aircraft_delay_df = spark.sql("SELECT Year, AVG((LateAircraftDelay / ArrDelay) * 100) AS avg_late_air_craft_delay FROM delay_flights WHERE Year BETWEEN 2003 AND 2010 AND LateAircraftDelay IS NOT NULL AND ArrDelay IS NOT NULL GROUP BY Year ORDER BY Year").show()
end_time = time.time()
execution_time = end_time - start_time
print(f"Execution time: {execution_time} seconds")

# Query to find year-wise security delay from 2003-2010
import time
start_time = time.time()
security_delay_df = spark.sql("SELECT Year, AVG((SecurityDelay / ArrDelay) * 100) AS avg_security_delay FROM delay_flights WHERE Year BETWEEN 2003 AND 2010 AND SecurityDelay IS NOT NULL AND ArrDelay IS NOT NULL GROUP BY Year ORDER BY Year").show()
end_time = time.time()
execution_time = end_time - start_time
print(f"Execution time: {execution_time} seconds")