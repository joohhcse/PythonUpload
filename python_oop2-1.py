#OOP2-1

#static method
class Earth:

	@staticmethod
	def getRadios():
		return 6400
	
	@staticmethod
	def getSurfaceArea():
		return 514457600
		
print('Earth Radios : {0}'.format(Earth.getRadios()))
print('Earth SurfaceArea : {0}'.format(Earth.getSurfaceArea()))

# class method
class PopulationStatistics:

	population = 0:
	
	def plusPopulation(self):
			PopulationStatistics.population += 1
			
	def minusPopulation(self):
			PopulationStatistics.population -= 1
			
	@classmethod
	def getPopulation(cls):
			return cls.population

PopulationStatistics().plusPopulation()
PopulationStatistics().plusPopulation()
PopulationStatistics().plusPopulation()
print(PopulationStatistics.getPopulation())

PopulationStatistics().minusPopulation()
print(PopulationStatistics.getPopulation())
