# database 1 # sqlite

# ex_delete.py
import sqlite3

conn = sqlite3.connect('C:/pythonLec/student.db')
cursor = conn.cursor()

cursor.execute("DELETE FROM T_STU_INFO WHERE ST_NAME='홍길동'")

conn.commit()
		
cursor.close()
conn.close()





