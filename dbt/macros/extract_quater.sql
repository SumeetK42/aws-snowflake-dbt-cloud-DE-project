{% macro extract_quater(p_date) %}
QUARTER({{ p_date }})
{% endmacro %}