#OOP1

class Bike

	#속성
	def __ init__(self):
		self.color = 'black'
		self.weight = 3
	
	def drive(self):
		print('drive')
		
	def brake(self):
		print('gear')
		
myBike = Bike()
friendBike = Bike()
hisBike = Bike()

print(myBike.color)
print(friendBike.color)

myBike.color = 'red'

print(myBike.color)
print(friendBike.color)

# self : 타 언어의 this에 해당하는 키워드로, 객체 자신을 가리킨다
