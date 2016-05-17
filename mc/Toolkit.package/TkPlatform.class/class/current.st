accessing
current 
	^ Current ifNil: [ 
		self useWorld.
		Current ]