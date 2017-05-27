--------------------------------------------------------
--  File created - Saturday-May-27-2017   
--------------------------------------------------------
DROP TABLE "ACCOUNT"."ROLE" cascade constraints;
DROP TABLE "ACCOUNT"."USER_ACCOUNT" cascade constraints;
DROP TABLE "ACCOUNT"."USER_ROLE" cascade constraints;
DROP SEQUENCE "ACCOUNT"."ROLE_SEQ";
DROP SEQUENCE "ACCOUNT"."USER_ACCOUNT_SEQ";
--------------------------------------------------------
--  DDL for Table ROLE
--------------------------------------------------------

  CREATE TABLE "ACCOUNT"."ROLE" 
   (	"ID" NUMBER(*,0), 
	"NAME" VARCHAR2(45 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table USER_ACCOUNT
--------------------------------------------------------

  CREATE TABLE "ACCOUNT"."USER_ACCOUNT" 
   (	"ID" NUMBER(*,0), 
	"USERNAME" VARCHAR2(255 BYTE), 
	"EMAIL" VARCHAR2(255 BYTE), 
	"PASSWORD" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table USER_ROLE
--------------------------------------------------------

  CREATE TABLE "ACCOUNT"."USER_ROLE" 
   (	"USER_ACCOUNT_ID" NUMBER(*,0), 
	"ROLE_ID" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Sequence ROLE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ACCOUNT"."ROLE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence USER_ACCOUNT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ACCOUNT"."USER_ACCOUNT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Index USER_ACCOUNT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACCOUNT"."USER_ACCOUNT_PK" ON "ACCOUNT"."USER_ACCOUNT" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ROLE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACCOUNT"."ROLE_PK" ON "ACCOUNT"."ROLE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger ROLE_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ACCOUNT"."ROLE_TRG" 
BEFORE INSERT ON "ACCOUNT"."ROLE" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT ROLE_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "ACCOUNT"."ROLE_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger USER_ACCOUNT_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ACCOUNT"."USER_ACCOUNT_TRG" 
BEFORE INSERT ON "ACCOUNT"."USER_ACCOUNT" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT USER_ACCOUNT_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "ACCOUNT"."USER_ACCOUNT_TRG" ENABLE;
--------------------------------------------------------
--  Constraints for Table USER_ROLE
--------------------------------------------------------

  ALTER TABLE "ACCOUNT"."USER_ROLE" MODIFY ("ROLE_ID" NOT NULL ENABLE);
  ALTER TABLE "ACCOUNT"."USER_ROLE" MODIFY ("USER_ACCOUNT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ROLE
--------------------------------------------------------

  ALTER TABLE "ACCOUNT"."ROLE" ADD CONSTRAINT "ROLE_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "ACCOUNT"."ROLE" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "ACCOUNT"."ROLE" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table USER_ACCOUNT
--------------------------------------------------------

  ALTER TABLE "ACCOUNT"."USER_ACCOUNT" ADD CONSTRAINT "USER_ACCOUNT_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "ACCOUNT"."USER_ACCOUNT" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "ACCOUNT"."USER_ACCOUNT" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "ACCOUNT"."USER_ACCOUNT" MODIFY ("USERNAME" NOT NULL ENABLE);
  ALTER TABLE "ACCOUNT"."USER_ACCOUNT" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table USER_ROLE
--------------------------------------------------------

  ALTER TABLE "ACCOUNT"."USER_ROLE" ADD CONSTRAINT "ROLE_FK" FOREIGN KEY ("ROLE_ID")
	  REFERENCES "ACCOUNT"."ROLE" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "ACCOUNT"."USER_ROLE" ADD CONSTRAINT "USER_ACCOUNT_FK" FOREIGN KEY ("USER_ACCOUNT_ID")
	  REFERENCES "ACCOUNT"."USER_ACCOUNT" ("ID") ON DELETE CASCADE ENABLE;
