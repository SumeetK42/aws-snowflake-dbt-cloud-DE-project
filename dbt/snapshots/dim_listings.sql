{% snapshot dim_listings %}

{{ config(
    target_schema = 'BNB_CURATED',
    unique_key = 'LISTING_ID',
    strategy = 'timestamp',
    updated_at = 'CREATED_AT'
) }}

select * FROM  {{ ref('listing') }}

{% endsnapshot %}