{% macro generate_schema_name(custom_schema_name, node) %}
    {%- if target.name in ['dev', 'default'] -%}
        -- For developers, use their default schema (whatever their Snowflake user has set)
        {{ target.schema }}
    {%- else -%}
        -- For builds / prod jobs, use schema defined in project.yml
        {{ custom_schema_name | upper }}
    {%- endif -%}
{% endmacro %}
