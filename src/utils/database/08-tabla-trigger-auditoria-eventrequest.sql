-- Ejecutar scripts 01, 02, 03, 04, 05, 06 y 07 antes de ejecutar este script.

-- Conectado como base2.
CONN base2/Clases.2023@freepdb1

CREATE TABLE auditoria_eventrequest (
    id              NUMBER
        GENERATED BY DEFAULT AS IDENTITY,
    tipo_operacion  VARCHAR2(10),
    fecha_operacion TIMESTAMP,
    usuario         VARCHAR2(30),
    old_eventno     VARCHAR2(8),
    new_eventno     VARCHAR2(8),
    old_custno      VARCHAR2(8),
    new_custno      VARCHAR2(8),
    old_facno       VARCHAR2(8),
    new_facno       VARCHAR2(8),
    old_budno       VARCHAR2(8),
    new_budno       VARCHAR2(8),
    old_dateheld    DATE,
    new_dateheld    DATE,
    old_datereq     DATE,
    new_datereq     DATE,
    old_dateauth    DATE,
    new_dateauth    DATE,
    old_estaudience NUMBER(38, 0),
    new_estaudience NUMBER(38, 0),
    old_estcost     NUMBER(15, 4),
    new_estcost     NUMBER(15, 4),
    old_status      VARCHAR2(20),
    new_status      VARCHAR2(20),
    PRIMARY KEY ( id )
);

CREATE OR REPLACE TRIGGER trigger_auditoria_eventrequest BEFORE
    INSERT OR UPDATE OR DELETE ON eventrequest
    FOR EACH ROW
DECLARE
    v_tipo_operacion VARCHAR2(10);
BEGIN
    IF inserting THEN
        v_tipo_operacion := 'INSERT';
    ELSIF updating THEN
        v_tipo_operacion := 'UPDATE';
    ELSIF deleting THEN
        v_tipo_operacion := 'DELETE';
    END IF;

    INSERT INTO auditoria_eventrequest (
        tipo_operacion,
        fecha_operacion,
        usuario,
        old_eventno,
        new_eventno,
        old_custno,
        new_custno,
        old_facno,
        new_facno,
        old_budno,
        new_budno,
        old_dateheld,
        new_dateheld,
        old_datereq,
        new_datereq,
        old_dateauth,
        new_dateauth,
        old_estaudience,
        new_estaudience,
        old_estcost,
        new_estcost,
        old_status,
        new_status        
    ) VALUES (
        v_tipo_operacion,
        systimestamp,
        user,
        :old.eventno,
        :new.eventno,
        :old.custno,
        :new.custno,
        :old.facno,
        :new.facno,
        :old.budno,
        :new.budno,
        :old.dateheld,
        :new.dateheld,
        :old.datereq,
        :new.datereq,
        :old.dateauth,
        :new.dateauth,
        :old.estaudience,
        :new.estaudience,
        :old.estcost,
        :new.estcost,
        :old.status,
        :new.status        
    );
END;

COMMIT;