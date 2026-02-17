{% macro response_rate_categorize(P_RESPONSE_RATE) %}
  CASE 
    WHEN {{ P_RESPONSE_RATE }} < 50 THEN 'LOW'
    WHEN {{ P_RESPONSE_RATE }} BETWEEN 50 AND 75 THEN 'MEDIUM'
    ELSE 'HIGH' 
    END
{% endmacro %}