-- Conectado como base2.

BEGIN  
  ORDS.define_template(
   p_module_name    => 'rest-v1',
   p_pattern        => 'customers/');

  -- READ : All customers.
  ORDS.define_handler(
    p_module_name    => 'rest-v1',
    p_pattern        => 'customers/',
    p_method         => 'GET',
    p_source_type    => ORDS.source_type_collection_feed,
    p_source         => 'SELECT * FROM customer ORDER BY custno',
    p_items_per_page => 0);

  -- READ : One Customer and it's events.
  ORDS.define_template(
   p_module_name    => 'rest-v1',
   p_pattern        => 'customers/:custno');

  ORDS.define_handler(
    p_module_name    => 'rest-v1',
    p_pattern        => 'customers/:custno',
    p_method         => 'GET',
    p_source_type    => ORDS.source_type_collection_feed,
    p_source         => 'SELECT * FROM view_customer_eventrequest WHERE custno = :custno',
    p_items_per_page => 0);

  COMMIT;
END;