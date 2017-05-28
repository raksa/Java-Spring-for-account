CREATE USER @jdbc.oracle.username@
    IDENTIFIED BY @jdbc.oracle.password@
    DEFAULT TABLESPACE "USERS"
    TEMPORARY TABLESPACE "TEMP"
    QUOTA 100M ON "USERS";

GRANT CONNECT TO @jdbc.oracle.username@;

GRANT CREATE TABLE TO @jdbc.oracle.username@;
GRANT CREATE SEQUENCE TO @jdbc.oracle.username@;
GRANT CREATE TRIGGER TO @jdbc.oracle.username@;
GRANT SELECT ANY TABLE, UPDATE ANY TABLE, DELETE ANY TABLE, INSERT ANY TABLE TO @jdbc.oracle.username@;