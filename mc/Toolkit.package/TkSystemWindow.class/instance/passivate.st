activation
passivate
	super passivate.
	self toolbarMorph ifNotNil: [ 
		self toolbarMorph fillStyle: (self theme windowInactiveFillStyleFor: self toolbarMorph) ]