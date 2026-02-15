{{ config(materialized='incremental',unique_key='HOST_ID',on_schema_change='sync_all_columns') }}

select 
HOST_ID,
{{ name_transform('HOST_NAME') }} AS HOST_NAME,
HOST_SINCE,
{{ CALC_HOST_TENURE('HOST_SINCE') }} AS HOST_TENURE_MONTHS ,--datediff(year,HOST_SINCE,current_date())
UPPER(IS_SUPERHOST) AS IS_SUPERHOST,
RESPONSE_RATE,
{{ response_rate_categorize('RESPONSE_RATE')  }} as RESPONSE_RATE_CATEGORY,
Created_at AS HOST_CREATED_AT,
'DBT_USER' AS HOST_CREATED_BY
 from
{{ ref('stg_hosts') }}
