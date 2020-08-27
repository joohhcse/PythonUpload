# database 1 # sqlite

# ex_table.py
import sqlite3

conn = sqlite3.connect('C:/pythonLec/student.db')
cursor = conn.cursor()

cursor.execute("CREATE TABLE T_STU_INFO(ST_NAME CHAR(32), ST_CODE CHAR(32), ST_MAJ CHAR(32), ST_GRA CHAR(32), ST_PHO CHAR(32))")

cursor.close()
conn.close()

























