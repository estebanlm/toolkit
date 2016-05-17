instance creation
object: anObject description: aDescription title: aString 
	^ self basicNew 
		initializeObject: anObject 
			description: aDescription 
			title: aString;
		yourself