-- Conectado como base2.

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