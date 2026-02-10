
{{ config(materialized='incremental') }}

{% set incremental_col = 'CREATED_AT' %}

select *
from {{ source('RAW','BNB_BOOKINGS') }}

{% if is_incremental() %}
where {{ incremental_col }} >
(
    select coalesce(
        max({{ incremental_col }}),
        '1900-01-01'
    )
    from {{ this }}
)
{% endif %}

-- this means this model i.e stg_bookings
