{% macro CALC_HOST_TENURE (P_HOST_SINCE) %}
    datediff(months,{{ P_HOST_SINCE }} , current_date() )
{% endmacro %} }