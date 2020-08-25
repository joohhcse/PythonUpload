#OOP3

#다중 상속
class ParentCls1:
		def __init__(self):
				pass
		
		def clsMethod(self)
				print('clsMethod1')
				
class ParentCls2:
		def __init__(self):
				pass
				
		def clsMethod2(self)
				print('clsMethod2')
				
class ParentCls3:
		def __init__(self):
				pass
				
		def clsMethod3(self)
				print('clsMethod3')
				
class ChildCls(ParentCls1, ParentCls2, ParentCls3):
		def __init__(self):
				pass
	
childCls = ChildCls()
childCls.clsMethod1()
childCls.clsMethod2()
childCls.clsMethod3()
				

