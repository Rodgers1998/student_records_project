{% macro validate_gender(column_name) %}
    {{ column_name }} IN ('Male', 'Female', 'Other')
{% endmacro %}
