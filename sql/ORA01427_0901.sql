

SELECT 
    T.CHILD_NAME
FROM TB_CHILD T
WHERE 1=1
    AND T.USER_ID = '001000108'
    AND T.STATUS IN ('0', '1', '2', '5', '6', '7')
    ORDER BY T.STATUS, T.SEQ;


SELECT 
    T.CHILD_NAME
FROM TB_CHILD T
WHERE 1=1
    AND T.USER_ID = '001000108'
    ORDER BY T.CHILD_NAME;


--SELECT CHILD_NAME, BIRTH_DAY, SEQ
SELECT *
FROM TB_CHILD
WHERE STATUS IN ('1', '5', '6', '7')
AND (TO_CHAR(TO_DATE(BIRTH_DAY, 'YYYY.MM.DD'), 'YYYY') + 9) || TO_CHAR(TO_DATE(BIRTH_DAY, 'YYYY.MM.DD') - 1, 'MMDD') >= TO_CHAR(SYSDATE, 'YYYYMMDD')
AND USER_ID = '001000108'
AND (
SELECT COUNT(DISTINCT TO_CHAR(S_DATE, 'YYYYMM'))
FROM TB_TRIP
WHERE SIN_USER_ID = USER_ID
AND KIND = '20'
AND RET_NO = '0'
AND STATUS IN ('2', '3')
) < 25
ORDER BY SEQ;


SELECT DISTINCT TO_CHAR(S_DATE, 'YYYYMM')
FROM TB_TRIP
WHERE SIN_USER_ID = '001000108'
AND KIND = '20'
AND RET_NO = '0'
AND STATUS IN ('2', '3');


SELECT TRIP_NO, TITLE, STATUS, KIND, RET_NO, CHILD, S_DATE, E_DATE
FROM TB_TRIP
WHERE SIN_USER_ID = '001000108'
AND KIND = '20'
AND RET_NO = '0'
AND STATUS IN ('2', '3')
ORDER BY S_DATE, E_DATE;

SELECT CHILD, COUNT(*)
FROM TB_TRIP
WHERE SIN_USER_ID = '001000108'
AND KIND = '20'
AND RET_NO = '0'
--AND STATUS IN ('2', '3')
AND S_DATE > TO_DATE('20200101', 'YYYYMMDD')
GROUP BY CHILD;

SELECT TRIP_NO, TITLE, STATUS, KIND, RET_NO, CHILD, S_DATE, E_DATE
FROM TB_TRIP
WHERE SIN_USER_ID = '001000108'
AND KIND = '20'
AND RET_NO = '0'
AND STATUS IN ('2', '3');

-------------------------------------------------------
-- trip_nursing.jsp

SELECT U.NAME, U.EMP_CODE, C.CHILD_NAME, C.BIRTH_DAY, C.SEQ, C.STATUS AS CHILDSTATUS, U.STATUS, U.USER_ID, C.BIRTH_DAY || '_' || C.SEQ AS CHILDID,
		(SELECT COUNT(DISTINCT TO_CHAR(S_DATE, 'YYYYMM'))
		FROM TB_TRIP T
		WHERE T.SIN_USER_ID = C.USER_ID
		AND T.CHILD = C.BIRTH_DAY || '_' || C.SEQ
		AND T.KIND = '20'
		AND T.RET_NO = '0'
		AND T.STATUS IN ('3') ) AS USECOUNT
		FROM TB_CHILD C, USR_GLOBAL U
		WHERE 1 = 1
		AND C.USER_ID = U.USER_ID
		AND C.STATUS IN ('1', '5', '6', '7')
		AND ( U.DEPT_ID IN (SELECT DEPT_ID FROM DEPT_TREE WHERE PAR_ID = '000012701' ) OR U.DEPT_ID = '000012701' )
		AND U.USER_ID = '001000108'
		ORDER BY U.DEPT_NAME, U.NAME, C.SEQ;
        
        -------------------------
        
        
        
        SELECT CHILD_NAME, BIRTH_DAY, SEQ
        --SELECT *
        FROM TB_CHILD
        WHERE STATUS IN ('1', '5', '6', '7')
        AND (TO_CHAR(TO_DATE(BIRTH_DAY, 'YYYY.MM.DD'), 'YYYY') + 9) || TO_CHAR(TO_DATE(BIRTH_DAY, 'YYYY.MM.DD') - 1, 'MMDD') >= TO_CHAR(SYSDATE, 'YYYYMMDD')
        AND USER_ID = '001000108'
        AND (
        SELECT COUNT(DISTINCT TO_CHAR(S_DATE, 'YYYYMM'))
        FROM TB_TRIP
        WHERE SIN_USER_ID = USER_ID
        AND KIND = '20'
        AND RET_NO = '0'
        AND STATUS IN ('2', '3')
        ) < 25
        ORDER BY SEQ;

        
        
        --20200903
       SELECT TMP.CHILD_NAME, TMP.BIRTH_DAY, TMP.SEQ, TMP.USECOUNT
       FROM
       (SELECT U.NAME, U.EMP_CODE, C.CHILD_NAME, C.BIRTH_DAY, C.SEQ, C.STATUS AS CHILDSTATUS, U.STATUS, U.USER_ID, C.BIRTH_DAY || '_' || C.SEQ AS CHILDID,
        (SELECT COUNT(DISTINCT TO_CHAR(S_DATE, 'YYYYMM'))
            FROM TB_TRIP T
            WHERE T.SIN_USER_ID = C.USER_ID
            AND T.CHILD = C.BIRTH_DAY || '_' || C.SEQ
            AND T.KIND = '20'
            AND T.RET_NO = '0'
            AND T.STATUS IN ('3')) AS USECOUNT
		FROM TB_CHILD C, USR_GLOBAL U
		WHERE 1 = 1
		AND C.USER_ID = U.USER_ID
		AND C.STATUS IN ('1', '5', '6', '7')
        AND (TO_CHAR(TO_DATE(BIRTH_DAY, 'YYYY.MM.DD'), 'YYYY') + 9) || TO_CHAR(TO_DATE(BIRTH_DAY, 'YYYY.MM.DD') - 1, 'MMDD') >= TO_CHAR(SYSDATE, 'YYYYMMDD')
		--AND ( U.DEPT_ID IN (SELECT DEPT_ID FROM DEPT_TREE WHERE PAR_ID = '000012701' ) OR U.DEPT_ID = '000012701' )
		AND U.USER_ID = '000000001' --'001000108' --'001000108'
		ORDER BY U.DEPT_NAME, U.NAME, C.SEQ) TMP
        WHERE TMP.USECOUNT < 25;
        
             
             
       
        --
        SELECT COUNT(DISTINCT TO_CHAR(S_DATE, 'YYYYMM'))
		FROM TB_TRIP T
		WHERE T.SIN_USER_ID = '001000108'
		AND T.CHILD = C.BIRTH_DAY || '_' || C.SEQ
		AND T.KIND = '20'
		AND T.RET_NO = '0'
		AND T.STATUS IN ('3');
		
        
        
        
        
-------------------------------------------------------		
-- registChild.jsp
SELECT T.USER_ID, T.CHILD_NAME, T.BIRTH_DAY, T.SEQ, T.STATUS, T.FILENAME, TO_CHAR(T.REGIST_DATE, 'YYYY/MM') AS REGIST_DATE,
		(SELECT M.CHILD_NAME 
		FROM TB_CHILD_MODIFY M 
		WHERE M.USER_ID = T.USER_ID AND M.SEQ = T.SEQ) AS M_CHILD_NAME,
		(SELECT M.BIRTH_DAY 
		FROM TB_CHILD_MODIFY M 
		WHERE M.USER_ID = T.USER_ID AND M.SEQ = T.SEQ) AS M_BIRTH_DAY
FROM TB_CHILD T
WHERE 1 = 1
AND T.USER_ID = 'id'
AND T.STATUS IN ('0', '1', '2', '5', '6', '7')
ORDER BY T.STATUS, T.SEQ;





		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

