create or replace stage aws_raw_stage
URL = '<your_s3_bucket_uri>'
STORAGE_INTEGRATION = S3_INT;

---- See and list the stages present in the snowflake

show stages;

list @aws_raw_stage;