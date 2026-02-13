{{ config(materialized='incremental',unique_key='BOOKING_ID',on_schema_change='sync_all_columns') }}
{% set precision =  2 %}

select 
BOOKING_ID,
LISTING_ID,
cast(BOOKING_DATE as date) as BOOKING_DATE,
{{ extract_year('BOOKING_DATE') }} AS YEAR_BOOKED,
{{ extract_month('BOOKING_DATE') }} AS MONTH_BOOKED,
{{ extract_quater('BOOKING_DATE') }} AS QUARTER_BOOKED,
CAST(NIGHTS_BOOKED AS INT) AS NIGHTS_BOOKED ,
BOOKING_AMOUNT ,
CAST(CLEANING_FEE AS INT) AS CLEANING_FEE ,
CAST(SERVICE_FEE AS INT) AS SERVICE_FEE ,
{{ calculate_price('NIGHTS_BOOKED','BOOKING_AMOUNT','CLEANING_FEE','SERVICE_FEE', 2 ) }} AS TOTAL_AMOUNT_IN_DOLLAR,
UPPER(BOOKING_STATUS) AS BOOKING_STATUS,
Created_at,
'DBT_USER' AS Created_by 
 from
{{ ref('stg_booking') }} 