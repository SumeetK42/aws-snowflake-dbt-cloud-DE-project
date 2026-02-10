select HOST_ID,
HOST_NAME,
HOST_SINCE,
IS_SUPERHOST,
RESPONSE_RATE
 from
{{ ref('stg_hosts') }}