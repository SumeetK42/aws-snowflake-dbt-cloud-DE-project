{% snapshot dim_bookings %}

{{ 
    config(
        target_schema = 'BNB_CURATED',
        strategy = 'timestamp',
        unique_key = 'BOOKING_ID',
        updated_at = 'CREATED_AT'
    )
}}

select * from {{ ref('booking') }}

{% endsnapshot %}