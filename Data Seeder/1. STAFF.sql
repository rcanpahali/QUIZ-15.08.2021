DROP TABLE STAFF CASCADE CONSTRAINTS;

CREATE TABLE STAFF
(
  S_STAFF_ID       INTEGER GENERATED ALWAYS AS IDENTITY ( START WITH 21 MAXVALUE 999999 MINVALUE 1 CYCLE CACHE 20 ORDER KEEP) NOT NULL,
  S_STAFF_NAME     VARCHAR2(50 BYTE)            NOT NULL,
  S_STAFF_SURNAME  VARCHAR2(50 BYTE)            NOT NULL
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING;


CREATE UNIQUE INDEX STAFF_PK ON STAFF
(S_STAFF_ID)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

ALTER TABLE STAFF ADD (
  CONSTRAINT STAFF_PK
  PRIMARY KEY
  (S_STAFF_ID)
  USING INDEX STAFF_PK
  ENABLE VALIDATE);


SET DEFINE OFF;
Insert into STAFF
   (S_STAFF_ID, S_STAFF_NAME, S_STAFF_SURNAME)
 Values
   (1, 'RAZIK CAN', 'PAHALI');
Insert into STAFF
   (S_STAFF_ID, S_STAFF_NAME, S_STAFF_SURNAME)
 Values
   (2, 'DERVIS', 'KAYIMBASIOGLU');
Insert into STAFF
   (S_STAFF_ID, S_STAFF_NAME, S_STAFF_SURNAME)
 Values
   (3, 'BELGAN', 'KORAL');
Insert into STAFF
   (S_STAFF_ID, S_STAFF_NAME, S_STAFF_SURNAME)
 Values
   (4, 'OSMAN', 'GÜNGÖR');
Insert into STAFF
   (S_STAFF_ID, S_STAFF_NAME, S_STAFF_SURNAME)
 Values
   (5, 'SONER', 'EKINCI');
Insert into STAFF
   (S_STAFF_ID, S_STAFF_NAME, S_STAFF_SURNAME)
 Values
   (6, 'MUSTAFA', 'TORUNCU');
Insert into STAFF
   (S_STAFF_ID, S_STAFF_NAME, S_STAFF_SURNAME)
 Values
   (7, 'EMRE', 'TORAMAN');
COMMIT;
