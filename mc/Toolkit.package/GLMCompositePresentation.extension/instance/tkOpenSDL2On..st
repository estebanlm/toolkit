*Toolkit-Glamour-dispatch
tkOpenSDL2On: anObject
	self startOn: anObject.
	^ (self defaultRenderer tkRenderSDL2Window: self) openInOSWindow