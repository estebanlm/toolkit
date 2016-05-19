initialization
initializeWrappedMorph
	wrappedMorph := (TkAthensWrapMorph window: self) 
		wrap: rootMorph;
		renderer: self renderer;
		yourself.
	wrappedMorph bounds: self bounds.		
	wrappedMorph setNeedsDisplay.