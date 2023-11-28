-- Conectado como base2.

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