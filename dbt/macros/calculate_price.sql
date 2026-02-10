{% macro calculate_price(P_NIGHTS_BOOKED,P_BOOKING_AMOUNT,P_CLEANING_FEE,P_SERVICE_FEE,P_precision) %}

  {% set V_NIGHTS_BOOKED = "cast(" ~ P_NIGHTS_BOOKED ~ " as int)" %}
  {% set V_BOOKING_AMOUNT = "cast(" ~ P_BOOKING_AMOUNT ~ " as int)" %}
  {% set V_CLEANING_FEE = "cast(" ~ P_CLEANING_FEE ~ " as int)" %}
  {% set V_SERVICE_FEE = "cast(" ~ P_SERVICE_FEE ~ " as int)" %}

   round
   (
     ({{ V_NIGHTS_BOOKED }} * {{ V_BOOKING_AMOUNT }}) + ( {{ V_CLEANING_FEE }}) + ( {{ V_SERVICE_FEE }})
    ,
    {{ P_precision }}
   ) 
{% endmacro %}