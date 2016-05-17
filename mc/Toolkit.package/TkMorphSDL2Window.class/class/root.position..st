instance creation
root: aMorph position: aPosition
	^ self basicNew 
		initializeRoot: aMorph atPosition: aPosition;
		yourself