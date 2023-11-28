-- Ejecutar scripts 01, 02, y 03 antes de ejecutar este script.

-- Conectado como base2.
CONN base2/Clases.2023@freepdb1

-- Habilitar ORDS.
BEGIN
  ORDS.enable_schema(
    p_enabled             => TRUE,
    p_schema              => 'base2',
    p_url_mapping_type    => 'BASE_PATH',
    p_url_mapping_pattern => 'eventos',
    p_auto_rest_auth      => FALSE
  );
    
  COMMIT;
END;

-- Ver esquemas habilitados.
SELECT parsing_schema, pattern
FROM   user_ords_schemas;

-- Module : A container for one or more templates, with an associated path (rest-v1/).
-- Template : A container for one or more handlers. The template must be unique within the module and is associated with a specific path (employees/), which may or may not include parameters.
-- Handler : A link to the actual work that is done. Typical handler methods include GET, POST, PUT, DELETE, which are passed in the HTTP header, rather than the URL. Each handler is associated with a specific source (or action), which can be of several types.

-- Base ORDS URL : http://localhost:8080/ords/
-- Schema (alias): http://localhost:8080/ords/base2/
-- Module        : http://localhost:8080/ords/base2/rest-v1/
-- Template      : http://localhost:8080/ords/base2/rest-v1/request/

-- Ver Modules.
SELECT id, name, uri_prefix
FROM   user_ords_modules
ORDER BY name;

-- Ver Templates.
SELECT id, module_id, uri_template
FROM   user_ords_templates
ORDER BY module_id;

-- Implementación de los procedimientos para los métodos GET, POST, PUT y DELETE para la tabla EVENTREQUEST.

-- PROCEDIMIENTO INSERT.
CREATE OR REPLACE PROCEDURE create_event (
  p_eventno   IN  eventrequest.eventno%TYPE,
  p_dateheld     IN  eventrequest.dateheld%TYPE,
  p_datereq       IN  eventrequest.datereq%TYPE,
  p_custno       IN  eventrequest.custno%TYPE,
  p_facno       IN  eventrequest.facno%TYPE,
  p_dateauth      IN  eventrequest.dateauth%TYPE,
  p_status    IN  eventrequest.status%TYPE,
  p_estcost   IN eventrequest.estcost%TYPE,
  p_estaudience IN eventrequest.estaudience%TYPE,
  p_budno IN eventrequest.budno%TYPE
)
AS
BEGIN
  Insert into EVENTREQUEST (EVENTNO,DATEHELD,DATEREQ,CUSTNO,FACNO,DATEAUTH,STATUS,ESTCOST,ESTAUDIENCE,BUDNO)  
  values (p_eventno,to_date(p_dateheld,'DD-MON-RR'),to_date(p_datereq,'DD-MON-RR'),p_custno,p_facno,to_date(p_dateauth,'DD-MON-RR'),p_status,p_estcost,p_estaudience,p_budno);
EXCEPTION
  WHEN OTHERS THEN
    HTP.print(SQLERRM);
END;

-- PROCEDIMIENTO UPDATE.
CREATE OR REPLACE PROCEDURE update_request (
  p_eventno   IN  eventrequest.eventno%TYPE,
  p_dateheld     IN  eventrequest.dateheld%TYPE,
  p_datereq       IN  eventrequest.datereq%TYPE,
  p_custno       IN  eventrequest.custno%TYPE,
  p_facno       IN  eventrequest.facno%TYPE,
  p_dateauth      IN  eventrequest.dateauth%TYPE,
  p_status    IN  eventrequest.status%TYPE,
  p_estcost   IN eventrequest.estcost%TYPE,
  p_estaudience IN eventrequest.estaudience%TYPE,
  p_budno IN eventrequest.budno%TYPE
)
AS
BEGIN
  UPDATE EVENTREQUEST
  SET dateheld = to_date(p_dateheld,'DD-MON-RR'),
  	datereq = to_date(p_datereq,'DD-MON-RR'),
	custno = p_custno,
	facno = p_facno,
	dateauth = to_date(p_dateauth,'DD-MON-RR'),
  	status = p_status,
  	estcost = p_estcost,
  	estaudience = p_estaudience,
  	budno = p_budno
  WHERE eventno  = p_eventno;
EXCEPTION
  WHEN OTHERS THEN
    HTP.print(SQLERRM);
END;

-- PROCEDIMIENTO DELETE.
CREATE OR REPLACE PROCEDURE remove_request (
  p_eventno   IN  eventrequest.eventno%TYPE
)
AS
BEGIN
  DELETE FROM eventrequest WHERE eventno = p_eventno;
EXCEPTION
  WHEN OTHERS THEN
    HTP.print(SQLERRM);
END;

COMMIT;

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

-- The web service supports the following URLs, methods, headers and payloads.

-- READ: All eventrequest.
-- http://localhost:8080/ords/base2/rest-v1/request/
-- READ: One eventrequest.
-- http://localhost:8080/ords/base2/rest-v1/request/E101


-- INSERT
-- URL        : http://localhost:8080/ords/eventos/rest-v1/request/
-- Method     : POST
-- Header     : Content-Type: application/json
-- Raw Payload: {"eventno": "E711","dateheld": "23-NOV-23","datereq": "28-JUL-23","custno": "C100","facno": "F100",
--         "dateauth": "23-JUL-22","status": "Approved","estcost": 5000,"estaudience": 80000,"budno": "B1000"
--     }

-- UPDATE
-- URL        : http://localhost:8080/ords/eventos/rest-v1/request/
-- Method     : PUT
-- Header     : Content-Type: application/json
-- Raw Payload: {        "eventno": "E711",        "dateheld": "01-NOV-23",        "datereq": "01-NOV-23",        "custno": "C100",        "facno": "F100",        "dateauth": "01-NOV-23",        "status": "Pending",        "estcost": 15000,
--         "estaudience": 50000,        "budno": "B1000"
--     }

-- DELETE
-- URL        : http://localhost:8080/ords/eventos/rest-v1/request/
-- Method     : DELETE
-- Header     : Content-Type: application/json
-- Raw Payload: {
--         "eventno": "E711"
--     }