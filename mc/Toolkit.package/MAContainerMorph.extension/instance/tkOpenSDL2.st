*Toolkit-Magritte-dispatch
tkOpenSDL2
	^ self morph openInOSWindow 
		when: WindowClosed send: #cancel to: self;
		yourself