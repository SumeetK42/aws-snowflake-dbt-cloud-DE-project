
{{ config(materialized='ephemeral') }}

with listings as (
select LISTING_ID,
PROPERTY_TYPE,
ROOM_TYPE,
CITY,
COUNTRY,
CAPACITY_CATEGORY,
PRICE_CATEGORY,
LISTING_CREATED_AT  from
 ( select LISTING_ID,
PROPERTY_TYPE,
ROOM_TYPE,
CITY,
COUNTRY,
CAPACITY_CATEGORY,
PRICE_CATEGORY,
LISTING_CREATED_AT , row_number() over (
partition by LISTING_ID,
PROPERTY_TYPE,
ROOM_TYPE,
CITY,
COUNTRY,
CAPACITY_CATEGORY,
PRICE_CATEGORY,
LISTING_CREATED_AT order by LISTING_ID 
) rk from {{ ref('OBT') }}
) where  rk = '1'
) select * from listings 