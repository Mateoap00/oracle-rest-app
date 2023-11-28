-- Conectado como base2.

-- Configuración de ords endpoints.
BEGIN
  ORDS.define_module(
    p_module_name    => 'rest-v1',
    p_base_path      => 'rest-v1/',
    p_items_per_page => 0);
  
  ORDS.define_template(
   p_module_name    => 'rest-v1',
   p_pattern        => 'request/');

-- READ : All records.
  ORDS.define_handler(
    p_module_name    => 'rest-v1',
    p_pattern        => 'request/',
    p_method         => 'GET',
    p_source_type    => ORDS.source_type_collection_feed,
    p_source         => 'SELECT * FROM eventrequest ORDER BY eventno',
    p_items_per_page => 0);

-- READ : One Record
  ORDS.define_template(
   p_module_name    => 'rest-v1',
   p_pattern        => 'request/:eventno');

  ORDS.define_handler(
    p_module_name    => 'rest-v1',
    p_pattern        => 'request/:eventno',
    p_method         => 'GET',
    p_source_type    => ORDS.source_type_collection_feed,
    p_source         => 'SELECT * FROM eventrequest WHERE eventno = :eventno',
    p_items_per_page => 0);

-- INSERT
  ORDS.define_handler(
    p_module_name    => 'rest-v1',
    p_pattern        => 'request/',
    p_method         => 'POST',
    p_source_type    => ORDS.source_type_plsql,
    p_source         => 'BEGIN
                           create_event (p_eventno    => :eventno,
                                            p_dateheld    => :dateheld,
                                            p_datereq      => :datereq,
                                            p_custno      => :custno,
                                            p_facno => :facno,
                                            p_dateauth      => :dateauth,
                                            p_status     => :status,
                                            p_estcost   => :estcost,
					    p_estaudience => :estaudience,
					    p_budno => :budno);
                         END;',
    p_items_per_page => 0);


-- UPDATE
  ORDS.define_handler(
    p_module_name    => 'rest-v1',
    p_pattern        => 'request/',
    p_method         => 'PUT',
    p_source_type    => ORDS.source_type_plsql,
    p_source         => 'BEGIN
                           update_request(
				  p_eventno   => :eventno,
				  p_dateheld  => :dateheld,
				  p_datereq   => :datereq,
				  p_custno    => :custno,
				  p_facno     => :facno,
				  p_dateauth  => :dateauth,
				  p_status    => :status,
				  p_estcost   => :estcost,
				  p_estaudience => :estaudience,
				  p_budno => :budno
				);
                         END;',
    p_items_per_page => 0);


-- DELETE
  ORDS.define_handler(
    p_module_name    => 'rest-v1',
    p_pattern        => 'request/',
    p_method         => 'DELETE',
    p_source_type    => ORDS.source_type_plsql,
    p_source         => 'BEGIN
                           remove_request(p_eventno => :eventno);
                         END;',
    p_items_per_page => 0);

  COMMIT;
END;