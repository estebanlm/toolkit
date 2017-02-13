instance creation
model: aModel description: aDescription
	^ self basicNew
		model: aModel; 
		magritteDescription: aDescription;
		initialize;
		yourself