-- Esquemas habilitados.
SELECT parsing_schema, pattern
FROM   user_ords_schemas;

-- Ver Modules.
SELECT id, name, uri_prefix
FROM   user_ords_modules
ORDER BY name;

-- Ver Templates.
SELECT id, module_id, uri_template
FROM   user_ords_templates
ORDER BY module_id;