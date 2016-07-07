activation
activate
	super activate.
	self toolbarMorph ifNotNil: [ 
		self toolbarMorph fillStyle: self toolbarMorph normalFillStyle ]