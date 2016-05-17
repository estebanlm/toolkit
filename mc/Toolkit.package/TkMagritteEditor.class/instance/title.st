accessing
title
	^ title ifNil: [ 
		self description 
			propertyAt: #tkGeneratorLabel 
			ifAbsent: [ self description label ] ]