{{ config(materialized='ephemeral') }}


with bookings as (
select 
BOOKING_ID,
BOOKING_DATE,
YEAR_BOOKED,
MONTH_BOOKED,
QUARTER_BOOKED,
NIGHTS_BOOKED,
BOOKING_STATUS,
BOOKING_CREATED_AT
 from 
{{ ref('OBT') }}
) select * from bookings
