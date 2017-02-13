instance creation
description: aDescription model: anObject on: aMorph
	^ self basicNew
		initializeDescription: aDescription 
			model: anObject 
			on: aMorph;
		yourself