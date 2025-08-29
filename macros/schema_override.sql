{% macro generate_schema_name(custom_schema_name, node) %}
    {# Use the schema exactly as defined in project.yml, without prefixing #}
    {{ custom_schema_name | lower }}
{% endmacro %}
