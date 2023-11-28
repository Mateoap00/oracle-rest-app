-- Conectado como base2.
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