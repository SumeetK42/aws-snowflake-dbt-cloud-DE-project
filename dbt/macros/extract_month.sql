{% macro extract_month(p_date) %}

TO_CHAR(TO_DATE({{ p_date }}), 'MMMM')

{% endmacro %}