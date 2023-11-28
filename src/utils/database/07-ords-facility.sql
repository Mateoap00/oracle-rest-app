-- Ejecutar scripts 01, 02, 03, 04, 05 y 06 antes de ejecutar este script.

-- Conectado como base2.
CONN base2/Clases.2023@freepdb1

BEGIN  
  ORDS.define_template(
   p_module_name    => 'rest-v1',
   p_pattern        => 'facilities/');

  -- READ : All facilities.
  ORDS.define_handler(
    p_module_name    => 'rest-v1',
    p_pattern        => 'facilities/',
    p_method         => 'GET',
    p_source_type    => ORDS.source_type_collection_feed,
    p_source         => 'SELECT * FROM facility ORDER BY facno',
    p_items_per_page => 0);

  -- READ : One Facility and it's events.
  ORDS.define_template(
   p_module_name    => 'rest-v1',
   p_pattern        => 'facilities/:facno');

  ORDS.define_handler(
    p_module_name    => 'rest-v1',
    p_pattern        => 'facilities/:facno',
    p_method         => 'GET',
    p_source_type    => ORDS.source_type_collection_feed,
    p_source         => 'SELECT * FROM view_facility_eventrequest WHERE facno = :facno',
    p_items_per_page => 0);

  COMMIT;
END;

-- READ: All facilities.
-- http://localhost:8080/ords/base2/rest-v1/facilities/
-- READ: One Facility and it's events.
-- http://localhost:8080/ords/base2/rest-v1/facilities/F101