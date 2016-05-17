instance creation
window: aWindow 
	^ self basicNew 
		initializeWindow: aWindow;
		yourself