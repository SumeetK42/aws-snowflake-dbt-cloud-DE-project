{{ config(materialized='incremental') }}

select * from 
{{ source('RAW','BNB_LISTINGS') }}

{% if is_incremental() %}
where created_at > (select coalesce(max(created_at),'1900-01-01') from {{ this }} ) 
{% endif %}

-- this means this model i.e stg_bookings