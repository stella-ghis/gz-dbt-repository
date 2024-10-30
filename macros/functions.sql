 {% macro margin_percent (col1, col2) %}
    ROUND(SAFE_DIVIDE({{col1}} - {{col2}}, {{col1}}), 2)
 {% endmacro %}