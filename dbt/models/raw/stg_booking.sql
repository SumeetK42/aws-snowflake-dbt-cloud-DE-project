
{% set incremental_flag = 1 %}
{% set incremental_col = 'CREATED_AT' %}

select *
from {{ source('RAW','BNB_BOOKINGS') }}

{% if incremental_flag == 1 %}
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
