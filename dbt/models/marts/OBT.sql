{% set configs_data = [

    {
       "table" : ref('enr_booking'),
       "alias" : "A_ENR_BOOKING",
       "columns" : "A_ENR_BOOKING.BOOKING_ID,
                    A_ENR_BOOKING.LISTING_ID,
                    A_ENR_BOOKING.BOOKING_DATE,
                    A_ENR_BOOKING.YEAR_BOOKED,
                    A_ENR_BOOKING.MONTH_BOOKED,
                    A_ENR_BOOKING.QUARTER_BOOKED,
                    A_ENR_BOOKING.NIGHTS_BOOKED,
                    A_ENR_BOOKING.BOOKING_AMOUNT,
                    A_ENR_BOOKING.CLEANING_FEE,
                    A_ENR_BOOKING.SERVICE_FEE,
                    A_ENR_BOOKING.TOTAL_AMOUNT_IN_DOLLAR,
                    A_ENR_BOOKING.BOOKING_STATUS"
    },
    {
       "table": ref('enr_listings'),
       "alias" : "A_ENR_LISTING",
       "columns": "
                    A_ENR_LISTING.HOST_ID,
                    A_ENR_LISTING.PROPERTY_TYPE,
                    A_ENR_LISTING.ROOM_TYPE,
                    A_ENR_LISTING.CITY,
                    A_ENR_LISTING.COUNTRY,
                    A_ENR_LISTING.ACCOMMODATES,
                    A_ENR_LISTING.CAPACITY_CATEGORY,
                    A_ENR_LISTING.BEDROOMS,
                    A_ENR_LISTING.BATHROOMS,
                    A_ENR_LISTING.SPACE_SCORE,
                    A_ENR_LISTING.PRICE_PER_NIGHT,
                    A_ENR_LISTING.PRICE_CATEGORY
                  ",
       "joining_condition" : "A_ENR_LISTING.LISTING_ID = A_ENR_BOOKING.LISTING_ID"
    },
    {
        "table" : ref('enr_hosts'),
        "alias" : "A_ENR_HOSTS",
        "columns" : "
                    A_ENR_HOSTS.HOST_NAME,
                    A_ENR_HOSTS.HOST_SINCE,
                    A_ENR_HOSTS.HOST_TENURE_MONTHS,
                    A_ENR_HOSTS.IS_SUPERHOST,
                    A_ENR_HOSTS.RESPONSE_RATE,
                    A_ENR_HOSTS.RESPONSE_RATE_CATEGORY
                    ",
        "joining_condition" : "A_ENR_HOSTS.HOST_ID = A_ENR_LISTING.HOST_ID"
    }
    ,
    {
        "columns" : "current_timestamp() as CREATE_DATE ,'DBT_USER' as CREATE_USER "
    }
]
%}

SELECT 
{% for config in configs_data %}
{{ config.columns }}  {%if not loop.last %} , {% endif %}
{% endfor %}
from
{% for config in configs_data  %}
{% if loop.first %}
{{config.table}} as {{config.alias}}
{% elif loop.last %}
    
{% else %}
left join {{config.table}} as {{config.alias}} on {{ config.joining_condition }}
{% endif %}
{% endfor %}

