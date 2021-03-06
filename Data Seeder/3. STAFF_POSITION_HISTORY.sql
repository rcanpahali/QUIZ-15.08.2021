DROP TABLE STAFF_POSITION_HISTORY CASCADE CONSTRAINTS;

CREATE TABLE STAFF_POSITION_HISTORY
(
  SPH_ID                NUMBER GENERATED ALWAYS AS IDENTITY ( START WITH 21 MAXVALUE 9999999 MINVALUE 1 CYCLE CACHE 20 ORDER KEEP) NOT NULL,
  SPH_STAFF_ID          NUMBER                  NOT NULL,
  SPH_START_DATE        DATE                    NOT NULL,
  SPH_END_DATE          DATE,
  SPH_MANAGER_STAFF_ID  NUMBER,
  SPH_POSITION_ID       NUMBER,
  SPH_STAFF_LOCATION    VARCHAR2(50 BYTE)       NOT NULL,
  SPH_SALARY            INTEGER                 NOT NULL
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


CREATE UNIQUE INDEX STAFF_HISTORY_PK ON STAFF_POSITION_HISTORY
(SPH_ID)
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

ALTER TABLE STAFF_POSITION_HISTORY ADD (
  CONSTRAINT STAFF_HISTORY_PK
  PRIMARY KEY
  (SPH_ID)
  USING INDEX STAFF_HISTORY_PK
  ENABLE VALIDATE);

ALTER TABLE STAFF_POSITION_HISTORY ADD (
  CONSTRAINT STAFF_POSITION_HISTORY_R01 
  FOREIGN KEY (SPH_STAFF_ID) 
  REFERENCES STAFF (S_STAFF_ID)
  ENABLE VALIDATE
,  CONSTRAINT STAFF_POSITION_HISTORY_R03 
  FOREIGN KEY (SPH_POSITION_ID) 
  REFERENCES POSITION (P_POSITION_ID)
  ENABLE VALIDATE
,  FOREIGN KEY (SPH_MANAGER_STAFF_ID) 
  REFERENCES STAFF (S_STAFF_ID)
  ENABLE VALIDATE);


SET DEFINE OFF;
Insert into STAFF_POSITION_HISTORY
   (SPH_ID, SPH_STAFF_ID, SPH_START_DATE, SPH_END_DATE, SPH_MANAGER_STAFF_ID, 
    SPH_POSITION_ID, SPH_STAFF_LOCATION, SPH_SALARY)
 Values
   (1, 1, TO_DATE('1/01/2021', 'DD/MM/YYYY'), TO_DATE('14/06/2021', 'DD/MM/YYYY'), 2, 
    7, 'LEFKOSA', 4500);
Insert into STAFF_POSITION_HISTORY
   (SPH_ID, SPH_STAFF_ID, SPH_START_DATE, SPH_END_DATE, SPH_MANAGER_STAFF_ID, 
    SPH_POSITION_ID, SPH_STAFF_LOCATION, SPH_SALARY)
 Values
   (2, 1, TO_DATE('14/07/2021', 'DD/MM/YYYY'), NULL, 2, 
    1, 'LEFKOSA', 4600);
Insert into STAFF_POSITION_HISTORY
   (SPH_ID, SPH_STAFF_ID, SPH_START_DATE, SPH_END_DATE, SPH_MANAGER_STAFF_ID, 
    SPH_POSITION_ID, SPH_STAFF_LOCATION, SPH_SALARY)
 Values
   (5, 2, TO_DATE('14/01/2021', 'DD/MM/YYYY'), NULL, 3, 
    1, 'LEFKOSA', 5500);
Insert into STAFF_POSITION_HISTORY
   (SPH_ID, SPH_STAFF_ID, SPH_START_DATE, SPH_END_DATE, SPH_MANAGER_STAFF_ID, 
    SPH_POSITION_ID, SPH_STAFF_LOCATION, SPH_SALARY)
 Values
   (6, 5, TO_DATE('1/01/2021', 'DD/MM/YYYY'), TO_DATE('18/03/2021', 'DD/MM/YYYY'), 3, 
    2, 'GAZIMAGUSA', 6000);
Insert into STAFF_POSITION_HISTORY
   (SPH_ID, SPH_STAFF_ID, SPH_START_DATE, SPH_END_DATE, SPH_MANAGER_STAFF_ID, 
    SPH_POSITION_ID, SPH_STAFF_LOCATION, SPH_SALARY)
 Values
   (7, 5, TO_DATE('30/04/2021', 'DD/MM/YYYY'), NULL, 3, 
    4, 'GIRNE', 6700);
Insert into STAFF_POSITION_HISTORY
   (SPH_ID, SPH_STAFF_ID, SPH_START_DATE, SPH_END_DATE, SPH_MANAGER_STAFF_ID, 
    SPH_POSITION_ID, SPH_STAFF_LOCATION, SPH_SALARY)
 Values
   (8, 3, TO_DATE('1/07/2020', 'DD/MM/YYYY'), NULL, 7, 
    6, 'LEFKOSA', 10000);
Insert into STAFF_POSITION_HISTORY
   (SPH_ID, SPH_STAFF_ID, SPH_START_DATE, SPH_END_DATE, SPH_MANAGER_STAFF_ID, 
    SPH_POSITION_ID, SPH_STAFF_LOCATION, SPH_SALARY)
 Values
   (9, 7, TO_DATE('23/02/2018', 'DD/MM/YYYY'), NULL, 7, 
    8, 'LEFKOSA', 50000);
COMMIT;
