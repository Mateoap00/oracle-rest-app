-- Conectado como base2;
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