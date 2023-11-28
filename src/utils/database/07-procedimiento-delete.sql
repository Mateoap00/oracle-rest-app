-- Conectado como base2.
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