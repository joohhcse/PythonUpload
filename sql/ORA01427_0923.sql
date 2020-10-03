SELECT DECODE(T.SEQ_NO, '','-',T.SEQ_NO) AS SEQ_NO, T.OWORK_NO, TO_CHAR(T.S_DATE,'YYYY.MM.DD HH24:MI') AS S_DATE, TO_CHAR(T.E_DATE,'HH24:MI') AS E_DATE, T.TITLE, T.SIN_USER_NAME, T.STATUS, T.SANC_USER_NAME,
( SELECT SIGNERNAME FROM TB_OW_TAN_SANC WHERE SEQ= ( SELECT MAX(SEQ) AS SEQ FROM TB_OW_TAN_SANC WHERE OWORK_NO = T.OWORK_NO AND STATUS = 1 ) AND OWORK_NO = T.OWORK_NO AND STATUS = 1 AND ROWNUM <= 1 ) AS LAST_SIGNER_NAME ,
TO_CHAR(T.ORG_S_DATE,'YYYY.MM.DD HH24:MI') AS ORG_S_DATE, TO_CHAR(T.ORG_E_DATE,'HH24:MI') AS ORG_E_DATE, INJUNG_TIME
, to_char(t.s_date, 'HH24') as s_hour, to_char(t.s_date, 'MI') as s_min
, to_char(t.e_date, 'HH24') as e_hour, to_char(t.e_date, 'MI') as e_min
, decode(kind, '1', '시차출퇴근제', '2', '조기퇴근제', '3', '근로시간단축') as kind, to_char(regist_date, 'YYYY.MM.DD HH24:MI') as regist_date
, nvl(to_char(t.org_s_date, 'HH24'), to_char(t.s_date, 'HH24')) as org_s_hour, nvl(to_char(t.org_s_date, 'MI'), to_char(t.s_date, 'MI')) as org_s_min,
nvl(to_char(t.org_e_date, 'HH24'), to_char(t.e_date, 'HH24')) as org_e_hour, nvl(to_char(t.org_e_date, 'MI'), to_char(t.e_date, 'MI')) as org_e_min
FROM TB_OW_TAN T
WHERE T.STATUS IN ('3', '0')
and ( t.sin_user_id = '001000256' )
--AND TO_CHAR(T.S_DATE,'YYYY.MM.DD') >= '20200901' AND TO_CHAR(T.S_DATE,'YYYY.MM.DD') <=  '20200921'
--and T.kind = '1'
ORDER BY T.SEQ_NO DESC;

-----------------------------------------------------------
-----------------------------------------------------------

SELECT 
( SELECT SIGNERNAME FROM TB_OW_TAN_SANC WHERE SEQ= ( SELECT MAX(SEQ) AS SEQ FROM TB_OW_TAN_SANC WHERE OWORK_NO = T.OWORK_NO AND STATUS = 1 ) AND OWORK_NO = T.OWORK_NO AND STATUS = 1 ) AS LAST_SIGNER_NAME 
FROM TB_OW_TAN T
WHERE T.STATUS IN ('3', '0')
and ( t.sin_user_id = '001000256' )
--AND TO_CHAR(T.S_DATE,'YYYY.MM.DD') >= '20200901' AND TO_CHAR(T.S_DATE,'YYYY.MM.DD') <=  '20200921'
--and T.kind = '3'
ORDER BY T.SEQ_NO DESC;




SELECT SIGNERNAME 
FROM TB_OW_TAN_SANC T1, TB_OW_TAN T2
WHERE SEQ = (SELECT MAX(SEQ) AS SEQ 
             FROM TB_OW_TAN_SANC
             WHERE OWORK_NO = T2.OWORK_NO AND STATUS = 1 )
AND T1.OWORK_NO = T1.OWORK_NO AND T1.STATUS = 1;



SELECT STATUS
FROM TB_OW_TAN_SANC WHERE STATUS = 1;;
FROM TB_OW_TAN WHERE STATUS = 1;

