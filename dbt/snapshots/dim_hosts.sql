{% snapshot dim_hosts %}

{{
    config (
      target_schema='BNB_CURATED',
      unique_key='HOST_ID',
      strategy='timestamp',
      updated_at='HOST_CREATED_AT'
    )
}}

select * from {{ ref('host') }}

{% endsnapshot %}