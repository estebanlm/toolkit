instance creation
owner: ownerObject object: anObject
	^ self basicNew 
		initializeOwner: ownerObject object: anObject;
		yourself