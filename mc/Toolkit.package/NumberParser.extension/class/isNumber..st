*Toolkit-Magritte
isNumber: anObject
	self parse: anObject onError: [ ^ false ].
	^ true