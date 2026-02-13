
{{ config(materialized='incremental',unique_key ='LISTING_ID') }} 

select  
LISTING_ID,
HOST_ID,
UPPER(PROPERTY_TYPE) AS PROPERTY_TYPE ,
{{ name_transform('ROOM_TYPE') }} as ROOM_TYPE ,
{{ name_transform('CITY') }} as CITY ,
upper(COUNTRY) as COUNTRY,
ACCOMMODATES,
{{ capacity_categorise('ACCOMMODATES') }}  as capacity_category ,
BEDROOMS,
BATHROOMS,
{{ calc_space_score('ACCOMMODATES','BEDROOMS','BATHROOMS') }} as  SPACE_SCORE ,
PRICE_PER_NIGHT,
{{ price_cat('PRICE_PER_NIGHT') }} as PRICE_CATEGORY,
Created_at,
'DBT_USER' AS Created_by 
FROM
{{ ref('stg_listings') }}