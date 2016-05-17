*Toolkit-Magritte
beForcePickOne: aString
	self propertyAt: #forcePickOne put: true.
	self extensible: true.
	self addCondition: [ :value | value notNil ] labelled: aString