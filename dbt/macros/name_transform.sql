{% macro name_transform(p_name) %}
  initcap ( trim( {{ p_name }} ) )
{% endmacro %}