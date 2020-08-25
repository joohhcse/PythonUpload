#OOP2

# __name__, __init__
class Student:

	doubleMajor = []
	
	def __init__(self, name, age, gender, major):
			self.name = name
			self.age = age
			self.gender = gender
			self.major = major
			#self.doubleMajor = []
			
	def printStudentInfo(self):
			print('name : {0}'.format(self.name))
			print('age : {0}'.format(self.age))
			print('gender : {0}'.format(self.gender))
			print('major : {0}'.format(self.major))
			print('school : {0}'.format(self.doubleMajor))
			
	def setDoubleMajor(self, doubleMajor):
			self.doubleMajor.append(doubleMajor)
			
gildong = Student('Hong Gildong', 20, 'M', '컴퓨터공학')
gildong.setDoubleMajor('국문학')
gildone.printStudentInfo()

suji = Student('Lee Suji', 20, 'W', '연극영화')
suji.setDoubleMajor('영문학')
suji.printStudentInfo()
