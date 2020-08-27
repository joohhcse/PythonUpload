#exception

try:
		userData = int(input())
		result = int(10 / userData)
except:
		print('Sorry~')
else:
		print('예외가 발생하지 않았어요')
finally:
		print('항상 실행 합니다.')






