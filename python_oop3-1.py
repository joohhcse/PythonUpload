#Abstract Class(추상클래스)
from abc import ABCMeta
from abc import abstractmethod

class Calculator(meetaclass=ABCMeta):
	
			def __init__(self)
					pass
					
			@abstractmethod
			def add(self):
					pass
					
			@abstractmethod
			def sub(self):
					pass
					
class SmartCalculator(Calculator):
		def __init__(self):
				pass
				
		def add(self):
				print('add method')
				
		def sub(self):
				print('sub method')
				
smartCalculator = SmartCalculator()
smartCalculator.add()
smartCalculator.sub()
