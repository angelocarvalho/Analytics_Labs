import sys
from datetime import datetime

from pyspark.sql import SparkSession
from pyspark.sql.functions import *

kafka_endpoint = 'host:port,host:port'
bucket_name = '<<bucketname>>'

spark = SparkSession\
    .builder\
    .appName("SparkStreamingETL")\
    .getOrCreate()

df = spark \
  .read \
  .format("kafka") \
  .option("kafka.bootstrap.servers", kafka_endpoint) \
  .option("subscribe", "AWSKafkaTutorialTopic") \
  .load()

json_df = df.selectExpr("CAST(key AS STRING)", "CAST(value AS STRING)").select("value")
new_df = spark.read.json(json_df.rdd.map(lambda r: r.value))
new_df.printSchema()
new_df.write.format("parquet").mode("overwrite").option("path", "s3://" + bucket_name + "/data/streaming/").saveAsTable("default.taxi_stream");