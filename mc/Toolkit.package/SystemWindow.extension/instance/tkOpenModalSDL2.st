*Toolkit-Platform-dispatch
tkOpenModalSDL2
	| window |
	
	window := self asTkSDL2Window.
	window center.
	window show.
	self waitUntilClosed.
	^ window