-- Ejecutar scripts 01, 02, 03 y 04 antes de ejecutar este script.

-- Conectado como base2.
CONN base2/Clases.2023@freepdb1

CREATE OR REPLACE VIEW view_customer_eventrequest AS
    SELECT
        c.custno,
        c.custname,
        c.address,
        c.phone,
        c.city,
        e.eventno,
        e.datereq,
        e.dateheld,
        e.dateauth,
        e.status
    FROM
             customer c
        JOIN eventrequest e ON c.custno = e.custno
        Order by e.eventno;

CREATE OR REPLACE VIEW view_facility_eventrequest AS
    SELECT
        f.facno,
        f.facname,
        e.eventno,
        e.datereq,
        e.dateheld,
        e.dateauth,
        e.status
    FROM
             facility f
        JOIN eventrequest e ON f.facno = e.facno
        Order by e.eventno;

COMMIT;