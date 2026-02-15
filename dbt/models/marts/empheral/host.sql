{{ config(materialized='ephemeral') }}

with hosts as (
select HOST_ID,
HOST_NAME,
IS_SUPERHOST,
RESPONSE_RATE_CATEGORY,
HOST_CREATED_AT
FROM {{ ref('OBT') }}
) select * from hosts