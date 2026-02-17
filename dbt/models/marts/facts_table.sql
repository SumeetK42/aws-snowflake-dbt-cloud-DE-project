{% 
    set configs  = [
        {
            "table" :  "BNB_CURATED.OBT",
            "columns" : "
            obt.BOOKING_ID , 
            obt.HOST_ID,
            obt.LISTING_ID,
            obt.BOOKING_AMOUNT,
            obt.CLEANING_FEE,
            obt.SERVICE_FEE,
            obt.TOTAL_AMOUNT_IN_DOLLAR,
            obt.ACCOMMODATES,
            obt.BEDROOMS,
            obt.BATHROOMS,
            obt.SPACE_SCORE,
            obt.PRICE_PER_NIGHT,
            obt.RESPONSE_RATE
            " ,
            "alias" : "obt" 
        },
        {
            "table" : "BNB_CURATED.DIM_HOSTS",
            "alias" : "host",
            "joining_cnd" : "host.HOST_ID = obt.host_id" 
        },
        {
            "table" : "BNB_CURATED.DIM_LISTINGS",
            "alias" : "listing",
            "joining_cnd" : "listing.LISTING_ID = obt.LISTING_ID"
        }
    ]
%}

select
{% for cnf in configs %}
{{ cnf.columns }}
{% endfor %}
 from 
{% for cnf in configs %}
  {% if loop.first %}
  {{ cnf.table }} as {{  cnf.alias }} 
  {% else %}
  LEFT join {{ cnf.table }} as {{  cnf.alias }} ON {{ cnf.joining_cnd }}
  {% endif %}
{% endfor %}