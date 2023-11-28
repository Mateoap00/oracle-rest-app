-- Ejecutar scripts 01, 02, 03, 04, 05, 06, 07 y 08 antes de ejecutar este script.

-- Conectado como base2.
CONN base2/Clases.2023@freepdb1

BEGIN  
  ORDS.define_template(
   p_module_name    => 'rest-v1',
   p_pattern        => 'audt-eventrequests/');

  -- READ : All audt-eventrequests.
  ORDS.define_handler(
    p_module_name    => 'rest-v1',
    p_pattern        => 'audt-eventrequests/',
    p_method         => 'GET',
    p_source_type    => ORDS.source_type_collection_feed,
    p_source         => 'SELECT * FROM auditoria_eventrequest ORDER BY id',
    p_items_per_page => 0);

  -- READ : One audt-eventrequests
  ORDS.define_template(
   p_module_name    => 'rest-v1',
   p_pattern        => 'audt-eventrequests/:id');

  ORDS.define_handler(
    p_module_name    => 'rest-v1',
    p_pattern        => 'audt-eventrequests/:id',
    p_method         => 'GET',
    p_source_type    => ORDS.source_type_collection_feed,
    p_source         => 'SELECT * FROM auditoria_eventrequest WHERE id = :id',
    p_items_per_page => 0);

  COMMIT;
END;

-- READ: All audt-eventrequests.
-- http://localhost:8080/ords/base2/rest-v1/audt-eventrequests/
-- READ: One audt-eventrequests
-- http://localhost:8080/ords/base2/rest-v1/audt-eventrequests/1