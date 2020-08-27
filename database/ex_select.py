# database 1 # sqlite

# ex_select.py
import sqlite3

conn = sqlite3.connect('C:/pythonLec/student.db')
cursor = conn.cursor()

cursor.execute("SELECT * FROM T_STU_INFO")

rows = cursor.fetchall()

for r in rows:
		print('ST_NAME:{0}, ST_CODE:{1}, ST_MAJ:{2}, ST_GRA:{3}, ST_PHO:{4}'.format(r[0], r[1], r[2], r[3], r[4]))
		
cursor.close()
conn.close()





