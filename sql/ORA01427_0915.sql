





 SELECT SIN_DEPT_NAME, SIN_USER_NAME, TEL, KIND, TO_CHAR(S_DATE,'YYYY')||'³â '||TO_CHAR(S_DATE,'MM')||'¿ù '||TO_CHAR(S_DATE,'DD')||'ÀÏ '||TO_CHAR(S_DATE,'HH24:MI') AS S_DATE, 
 TO_CHAR(E_DATE,'YYYY')||'³â '||TO_CHAR(E_DATE,'MM')||'¿ù '||TO_CHAR(E_DATE,'DD')||'ÀÏ '||TO_CHAR(E_DATE,'HH24:MI') AS E_DATE, TITLE, DEST, TRIP_DAY, TRIP_DAY_FLAG, SANC_USER_NAME, 	
 trip_day_amount,replace(replace(triP_day_amount_txt,chr(10),'&nbsp;<br>'),chr(13),' ') as trip_day_amount_txt, to_char(make_date, 'YYYY.MM.DD.') as work_day, etc, moving, 
 nvl(u.DUTY_NAME || R.RANK_NAME, '') as pos_name, nvl(y.trip_max_yunga, '0') as trip_max_yunga,
 (SELECT (NVL(SUM(DECODE(tt.TRIP_DAY_FLAG,'D',tt.TRIP_DAY)),0) + NVL(SUM(DECODE(tt.TRIP_DAY_FLAG,'T',(tt.TRIP_DAY/60/60)))/8,0))*8*60 	
 FROM TB_TRIP tt
 WHERE tt.STATUS='3'
 AND tt.KIND IN('3', '6', '15')
 AND tt.RET_NO <= 0
 and tt.sin_user_id = t.sin_user_id
 and to_char(tt.s_date, 'YYYY') = to_char(t.s_date, 'YYYY')
 and to_char(tt.e_date, 'YYYYMMDD') < to_char(t.s_date, 'YYYYMMDD')	) as yunga_tot,
 (select signername from tb_trip_sanc s where s.trip_no = t.trip_no and seq = '1') as sign1,
 (select signername from tb_trip_sanc s where s.trip_no = t.trip_no and seq = '2') as sign2,
 (select signername from tb_trip_sanc s where s.trip_no = t.trip_no and seq = '3') as sign3,
 (select signername from tb_trip_sanc s where s.trip_no = t.trip_no and seq = '4') as sign4,
 (select signername from tb_trip_sanc s where s.trip_no = t.trip_no and seq = '5') as sign5,
 (select signername from tb_trip_sanc s where s.trip_no = t.trip_no and seq = '6') as sign6,
 (select signerdutyname from tb_trip_sanc s where s.trip_no = t.trip_no and seq = '1') as pos1,
 (select signerdutyname from tb_trip_sanc s where s.trip_no = t.trip_no and seq = '2') as pos2,
 (select signerdutyname from tb_trip_sanc s where s.trip_no = t.trip_no and seq = '3') as pos3,
 (select signerdutyname from tb_trip_sanc s where s.trip_no = t.trip_no and seq = '4') as pos4,
 (select signerdutyname from tb_trip_sanc s where s.trip_no = t.trip_no and seq = '5') as pos5,
 (select signerdutyname from tb_trip_sanc s where s.trip_no = t.trip_no and seq = '6') as pos6,
 (select to_char(signdate, 'MM/DD') from tb_trip_sanc s where s.trip_no = t.trip_no and seq = '1') as sd1,
 (select to_char(signdate, 'MM/DD') from tb_trip_sanc s where s.trip_no = t.trip_no and seq = '2') as sd2,
 (select to_char(signdate, 'MM/DD') from tb_trip_sanc s where s.trip_no = t.trip_no and seq = '3') as sd3,
 (select to_char(signdate, 'MM/DD') from tb_trip_sanc s where s.trip_no = t.trip_no and seq = '4') as sd4,
 (select to_char(signdate, 'MM/DD') from tb_trip_sanc s where s.trip_no = t.trip_no and seq = '5') as sd5,
 (select to_char(signdate, 'MM/DD') from tb_trip_sanc s where s.trip_no = t.trip_no and seq = '6') as sd6,
-- (select to_char(signdate, 'MM/DD') from tb_trip_sanc s where s.trip_no = t.trip_no and s.sanc_type='ÇùÁ¶') as tong,
 (SELECT a.tmp
  FROM (
            select to_char(signdate, 'MM/DD') AS tmp from tb_trip_sanc s where s.trip_no = 220934 and s.sanc_type='ÇùÁ¶'
            order by s.signdate DESC
        ) a
 WHERE ROWNUM <=1) as tong,
-- (select signername from tb_trip_sanc s where s.trip_no = t.trip_no and s.sanc_type='ÇùÁ¶') as checkusername
 (SELECT b.signername
  FROM (
            select signername from tb_trip_sanc s where s.trip_no = 220934 and s.sanc_type='ÇùÁ¶'
            order by s.signdate DESC
        ) b
 WHERE ROWNUM <=1) as checkusername
 FROM TB_TRIP t, usr_global u, pos p, tb_trip_yunga y, rank r
 WHERE TRIP_NO = 220934 and t.sin_user_id = u.user_id and u.pos_id = p.pos_id and t.sin_user_id = y.trip_user_id and to_char(t.s_date, 'YYYY') = y.trip_year
 AND u.rank_id = r.rank_id(+);

-- 220934 / /


SELECT *
  FROM (
            select to_char(signdate, 'MM/DD') tmp from tb_trip_sanc s where s.trip_no = 220934 and s.sanc_type='ÇùÁ¶'
            order by s.signdate DESC
        ) a
 WHERE ROWNUM <=1;

SELECT to_char(signdate, 'MM/DD'), signername
FROM tb_trip_sanc s, TB_TRIP t
WHERE s.trip_no = 220934 AND s.sanc_type = 'ÇùÁ¶';

select signername
from tb_trip_sanc s,  TB_TRIP t
where s.trip_no = t.trip_no and s.sanc_type='ÇùÁ¶';


SELECT to_char(signdate, 'MM/DD'), signername
FROM tb_trip_sanc s, TB_TRIP t
WHERE s.trip_no = 220934 AND s.sanc_type = 'ÇùÁ¶'
AND ROWNUM <= 2;



------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------


 SELECT SIN_DEPT_NAME, SIN_USER_NAME, TEL, KIND, TO_CHAR(S_DATE,'YYYY')||'³â '||TO_CHAR(S_DATE,'MM')||'¿ù '||TO_CHAR(S_DATE,'DD')||'ÀÏ '||TO_CHAR(S_DATE,'HH24:MI') AS S_DATE, 
 TO_CHAR(E_DATE,'YYYY')||'³â '||TO_CHAR(E_DATE,'MM')||'¿ù '||TO_CHAR(E_DATE,'DD')||'ÀÏ '||TO_CHAR(E_DATE,'HH24:MI') AS E_DATE, TITLE, DEST, TRIP_DAY, TRIP_DAY_FLAG, SANC_USER_NAME, 	
 trip_day_amount,replace(replace(triP_day_amount_txt,chr(10),'&nbsp;<br>'),chr(13),' ') as trip_day_amount_txt, to_char(make_date, 'YYYY.MM.DD.') as work_day, etc, moving, 
 nvl(u.DUTY_NAME || R.RANK_NAME, '') as pos_name, nvl(y.trip_max_yunga, '0') as trip_max_yunga,
 (SELECT (NVL(SUM(DECODE(tt.TRIP_DAY_FLAG,'D',tt.TRIP_DAY)),0) + NVL(SUM(DECODE(tt.TRIP_DAY_FLAG,'T',(tt.TRIP_DAY/60/60)))/8,0))*8*60 	
 FROM TB_TRIP tt
 WHERE tt.STATUS='3'
 AND tt.KIND IN('3', '6', '15')
 AND tt.RET_NO <= 0
 and tt.sin_user_id = t.sin_user_id
 and to_char(tt.s_date, 'YYYY') = to_char(t.s_date, 'YYYY')
 and to_char(tt.e_date, 'YYYYMMDD') < to_char(t.s_date, 'YYYYMMDD')	) as yunga_tot,
 (select signername from tb_trip_sanc s where s.trip_no = t.trip_no and seq = '1') as sign1,
 (select signername from tb_trip_sanc s where s.trip_no = t.trip_no and seq = '2') as sign2,
 (select signername from tb_trip_sanc s where s.trip_no = t.trip_no and seq = '3') as sign3,
 (select signername from tb_trip_sanc s where s.trip_no = t.trip_no and seq = '4') as sign4,
 (select signername from tb_trip_sanc s where s.trip_no = t.trip_no and seq = '5') as sign5,
 (select signername from tb_trip_sanc s where s.trip_no = t.trip_no and seq = '6') as sign6,
 (select signerdutyname from tb_trip_sanc s where s.trip_no = t.trip_no and seq = '1') as pos1,
 (select signerdutyname from tb_trip_sanc s where s.trip_no = t.trip_no and seq = '2') as pos2,
 (select signerdutyname from tb_trip_sanc s where s.trip_no = t.trip_no and seq = '3') as pos3,
 (select signerdutyname from tb_trip_sanc s where s.trip_no = t.trip_no and seq = '4') as pos4,
 (select signerdutyname from tb_trip_sanc s where s.trip_no = t.trip_no and seq = '5') as pos5,
 (select signerdutyname from tb_trip_sanc s where s.trip_no = t.trip_no and seq = '6') as pos6,
 (select to_char(signdate, 'MM/DD') from tb_trip_sanc s where s.trip_no = t.trip_no and seq = '1') as sd1,
 (select to_char(signdate, 'MM/DD') from tb_trip_sanc s where s.trip_no = t.trip_no and seq = '2') as sd2,
 (select to_char(signdate, 'MM/DD') from tb_trip_sanc s where s.trip_no = t.trip_no and seq = '3') as sd3,
 (select to_char(signdate, 'MM/DD') from tb_trip_sanc s where s.trip_no = t.trip_no and seq = '4') as sd4,
 (select to_char(signdate, 'MM/DD') from tb_trip_sanc s where s.trip_no = t.trip_no and seq = '5') as sd5,
 (select to_char(signdate, 'MM/DD') from tb_trip_sanc s where s.trip_no = t.trip_no and seq = '6') as sd6,
 (select to_char(signdate, 'MM/DD') from tb_trip_sanc s where s.trip_no = t.trip_no and s.sanc_type='ÇùÁ¶' and rownum <=1) as tong,
 (select signername from tb_trip_sanc s where s.trip_no = t.trip_no and s.sanc_type='ÇùÁ¶' and rownum <=1) as checkusername
 FROM TB_TRIP t, usr_global u, pos p, tb_trip_yunga y, rank r
 WHERE TRIP_NO = 220934 and t.sin_user_id = u.user_id and u.pos_id = p.pos_id and t.sin_user_id = y.trip_user_id and to_char(t.s_date, 'YYYY') = y.trip_year
 AND u.rank_id = r.rank_id(+);










