initialization
initializeRoot: aMorph 
	rootMorph := aMorph.
	self initializeSDLWindow.
	self initializeWrappedMorph.
	self initialize
