--------------------------------------------------------
--  File created - Saturday-May-27-2017   
--------------------------------------------------------
REM INSERTING into "@jdbc.oracle.username@"."ROLE"
SET DEFINE OFF;
Insert into "@jdbc.oracle.username@"."ROLE" (ID,NAME) values (1,'ROLE_USER');
Insert into "@jdbc.oracle.username@"."ROLE" (ID,NAME) values (2,'ROLE_ADMIN');
REM INSERTING into "@jdbc.oracle.username@"."USER_ACCOUNT"
SET DEFINE OFF;
Insert into "@jdbc.oracle.username@"."USER_ACCOUNT" (ID,USERNAME,EMAIL,PASSWORD) values (1,'username','test@mail.local','$2a$11$I186oy5zBV1pMSA3wQo6iO0RhYKNkzG7XB.n1hCVKq7q6MzOlM29C');
REM INSERTING into "@jdbc.oracle.username@"."USER_ROLE"
SET DEFINE OFF;
Insert into "@jdbc.oracle.username@"."USER_ROLE" (USER_ACCOUNT_ID,ROLE_ID) values (1,1);

---
--- Set new value for sequences
---
ALTER SEQUENCE "@jdbc.oracle.username@"."ROLE_SEQ" INCREMENT BY 2;
SELECT "@jdbc.oracle.username@"."ROLE_SEQ".NEXTVAL FROM "DUAL";
ALTER SEQUENCE "@jdbc.oracle.username@"."ROLE_SEQ" INCREMENT BY 1;

ALTER SEQUENCE "@jdbc.oracle.username@"."USER_ACCOUNT_SEQ" INCREMENT BY 1;
SELECT "@jdbc.oracle.username@"."USER_ACCOUNT_SEQ".NEXTVAL FROM "DUAL";
ALTER SEQUENCE "@jdbc.oracle.username@"."USER_ACCOUNT_SEQ" INCREMENT BY 1;