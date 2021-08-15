---------------------------------------- ADIM 1 ----------------------------------------
-- RETURN TYPE OLUŞTURULUR
CREATE OR REPLACE TYPE O_GET_STAFF AS OBJECT
( 
  V_STAFF_ID    NUMBER,
  V_STAFF_NAME    VARCHAR(50),
  V_STAFF_SURNAME    VARCHAR(50),
  V_STAFF_DEPARTMENT VARCHAR(50),
  V_CURRENT_POSITION_NAME  VARCHAR(50),
  V_PREVIOUS_POSITION_NAME  VARCHAR(50),
  V_MANAGER_NAME   VARCHAR(50),
  V_STAFF_LOCATION VARCHAR(50)
);

---------------------------------------- ADIM 2 ----------------------------------------

-- CURSOR'DEN DÖNECEK SONUÇLARI LİST HALİNE GETİRMEK İÇİN TYPE'I KULLANILIR
CREATE TYPE L_GET_STAFF AS TABLE OF O_GET_STAFF;

---------------------------------------- ADIM 3 ----------------------------------------

-- WEB SERVİS TARAFINDAN ÇAĞRILACAK FUNCTION'I TANIMLANIR
CREATE OR REPLACE FUNCTION F_GET_STAFF_LIST
    RETURN L_GET_STAFF
    PIPELINED
AS
    -- DEGİŞKENLERİ TANIMLA
    O_STAFF             O_GET_STAFF;

    PREVIOUS_POSITION   VARCHAR2 (50);
    MANAGER_NAME        VARCHAR2 (50);
    V_CNT               NUMBER;

    --CURSOR TANIMLA
    CURSOR C1 IS            
          SELECT S.S_STAFF_ID,
                 S.S_STAFF_NAME,
                 S.S_STAFF_SURNAME,
                 P.P_POSITION_DESC,
                 P.P_POSITION_DEPARTMENT,
                 SPH.SPH_STAFF_LOCATION,
                 --ÖNCEKİ POZİSYON VE YÖNETİCİ ADI İÇİN SUB QUERY
                 (     SELECT SQ1.SPH_POSITION_ID
                         FROM STAFF_POSITION_HISTORY SQ1
                        WHERE     SQ1.SPH_STAFF_ID = SPH.SPH_STAFF_ID
                              AND SQ1.SPH_END_DATE IS NOT NULL
                     ORDER BY SQ1.SPH_END_DATE DESC
                  FETCH FIRST 1 ROWS ONLY)    AS PREVIOUS_POSITION_ID,
                 (     SELECT SQ2.SPH_MANAGER_STAFF_ID
                         FROM STAFF_POSITION_HISTORY SQ2
                        WHERE SQ2.SPH_STAFF_ID = SPH.SPH_STAFF_ID
                     ORDER BY SQ2.SPH_END_DATE DESC
                  FETCH FIRST 1 ROWS ONLY)    AS MANAGER_ID
            FROM STAFF S
                 LEFT JOIN STAFF_POSITION_HISTORY SPH
                     ON SPH.SPH_STAFF_ID = S.S_STAFF_ID
                 JOIN POSITION P ON P.P_POSITION_ID = SPH.SPH_POSITION_ID
           WHERE     P.P_POSITION_DEPARTMENT = 'IT' --PARAMETRE OLARAK WEB SERVİSTEN ALINABİLİR
                 AND SPH.SPH_SALARY > 4200 --PARAMETRE OLARAK WEB SERVİSTEN ALINABİLİR
                 AND SPH.SPH_END_DATE IS NULL
        ORDER BY S.S_STAFF_NAME ASC;
   
    TYPE STAFF_TAB IS TABLE OF C1%ROWTYPE;
    V_STAFF_TAB         STAFF_TAB;
    
BEGIN
    LOOP
        OPEN C1;
        --SONUÇLARI PARÇALAYARAK AL
        FETCH C1 BULK COLLECT INTO V_STAFF_TAB LIMIT 100;

        FOR I IN 1 .. V_STAFF_TAB.COUNT
        LOOP
            --SONUÇ DÖNER Mİ KONTROL ET
            SELECT COUNT (*)
              INTO V_CNT
              FROM POSITION P
             WHERE P.P_POSITION_ID = V_STAFF_TAB (I).PREVIOUS_POSITION_ID;

            IF V_CNT != 0
            THEN
                SELECT P.P_POSITION_DESC
                  INTO PREVIOUS_POSITION
                  FROM POSITION P
                 WHERE P.P_POSITION_ID = V_STAFF_TAB (I).PREVIOUS_POSITION_ID;
            ELSE
                PREVIOUS_POSITION := '';
            END IF;

            SELECT S.S_STAFF_NAME || ' ' || S.S_STAFF_SURNAME
              INTO MANAGER_NAME
              FROM STAFF S
             WHERE S.S_STAFF_ID = V_STAFF_TAB (I).MANAGER_ID;

            --CURSOR'DEN DÖNEN SONUÇLARI OBJENİN İÇERİSİNE GEÇ
            O_STAFF :=
                O_GET_STAFF (V_STAFF_TAB (I).S_STAFF_ID,
                             V_STAFF_TAB (I).S_STAFF_NAME,
                             V_STAFF_TAB (I).S_STAFF_SURNAME,
                             V_STAFF_TAB (I).P_POSITION_DEPARTMENT,
                             V_STAFF_TAB (I).P_POSITION_DESC,
                             PREVIOUS_POSITION,
                             MANAGER_NAME,
                             V_STAFF_TAB (I).SPH_STAFF_LOCATION);
            --SONRAKİ KAYDA GEÇ
            PIPE ROW (O_STAFF);
        END LOOP;
        EXIT;
    END LOOP;
    --CURSOR KAPAT
    CLOSE C1;
    RETURN;
END;