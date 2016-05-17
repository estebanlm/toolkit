initialization
initializeEventHandler
	self eventHandler: (TkSDL2EventHandler new
		window: self;
		yourself)