initialization
initializeEventHandler
	self eventHandler: ((TkSystemWindowSDL2EventHandler for: self rootMorph)
		window: self;
		yourself)