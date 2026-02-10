{% macro calc_space_score(P_ACCOMMODATES,P_BEDROOMS,P_BATHROOMS) %}
  ( {{ P_ACCOMMODATES }} * 1.5) + {{ P_BEDROOMS }} + {{ P_BATHROOMS }} 
{% endmacro %}