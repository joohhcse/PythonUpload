# database 1 # sqlite

# ex_insert.py
import sqlite3

conn = sqlite3.connect('C:/pythonLec/student.db')
cursor = conn.cursor()

cursor.execute("INSERT INTO T_STU_INFO(ST_NAME, ST_CODE, ST_MAJ, ST_GRA, ST_PHO) VALUE('홍길동', 'ST0001', '디자인', '3', '010-1234-1234'")

id = cursor.lastrowid
print(id)

cursor.execute("INSERT INTO T_STU_INFO(ST_NAME, ST_CODE, ST_MAJ, ST_GRA, ST_PHO) VALUE('홍길순', 'ST0002', '컴공', '2', '010-1234-1234'")

id = cursor.lastrowid
print(id)

cursor.execute("INSERT INTO T_STU_INFO(ST_NAME, ST_CODE, ST_MAJ, ST_GRA, ST_PHO) VALUE('홍길자', 'ST0003', '전기전자', '2', '010-1234-1234'")
print(id)

conn.commit()

cursor.close()
conn.close()

























