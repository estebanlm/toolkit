initialization
initializeWrappedMorph
	wrappedMorph := (TkAthensWrapMorph window: self) 
		wrap: rootMorph;
		renderer: self renderer;
		yourself.
	wrappedMorph setNeedsDisplay