#exception
try:
		userData = int(input())
		result = int(10 / userData)
		print('result : {0}'.format(result))
except ZeroDivisionError as e:
		print('ZeroDivisionError 예외발생'.format(e))


		
		

