/*{% macro generate_schema_name(custom_schema_name, node) %}
    {# Use the schema exactly as defined in project.yml, without prefixing #}
    {{ custom_schema_name | lower }}
{% endmacro %}
*/
{% macro generate_schema_name(custom_schema_name, node) %}
    {# 
      If running in dbt Cloud or CI/CD (DEPLOYMENT_ENV = "prod"),
      then use the schema from project.yml (e.g., SILVER/GOLD).
      Otherwise, use the default schema from developer's connection.
    #}

    {% if env_var('DEPLOYMENT_ENV', 'dev') == 'prod' %}
        {{ custom_schema_name | upper }}
    {% else %}
        {{ target.schema }}
    {% endif %}
{% endmacro %}
