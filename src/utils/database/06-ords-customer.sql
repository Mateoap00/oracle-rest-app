-- Ejecutar scripts 01, 02, 03, 04 y 05 antes de ejecutar este script.

-- Conectado como base2.
CONN base2/Clases.2023@freepdb1

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

-- READ : All customers.
-- http://localhost:8080/ords/base2/rest-v1/customers/
-- READ : One Customer and it's events.
-- http://localhost:8080/ords/base2/rest-v1/customers/C100