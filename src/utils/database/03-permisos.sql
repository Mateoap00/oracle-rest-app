-- Conectado como system/sys/sysdba o admin.
GRANT
    CREATE SESSION,
    CREATE TABLE,
    CREATE PROCEDURE,
    CREATE TYPE,
    CREATE TRIGGER,
    CREATE VIEW,
    CREATE MATERIALIZED VIEW,
    CREATE SEQUENCE, connect, resource,
    UNLIMITED TABLESPACE
TO base2;
COMMIT;