
{{ config(materialized='ephemeral') }}

with listings as (
select 
LISTING_ID,
PROPERTY_TYPE,
ROOM_TYPE,
CITY,
COUNTRY,
CAPACITY_CATEGORY,
PRICE_CATEGORY,
CREATED_AT
 from 
{{ ref('OBT') }}
) select * from listings 