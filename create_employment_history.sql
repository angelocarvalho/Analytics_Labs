CREATE EXTERNAL TABLE `employment_history`(
  `start_date` string, 
  `end_date` string, 
  `employer_name` string, 
  `position_held` string, 
  `reason_for_leaving` string, 
  `application_id` string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://{}/data/analytics/employment_history/'
TBLPROPERTIES (
  'CrawlerSchemaDeserializerVersion'='1.0', 
  'CrawlerSchemaSerializerVersion'='1.0', 
  'UPDATED_BY_CRAWLER'='c1', 
  'averageRecordSize'='255', 
  'classification'='parquet', 
  'compressionType'='none', 
  'objectCount'='1', 
  'recordCount'='3', 
  'sizeKey'='5341', 
  'typeOfData'='file')