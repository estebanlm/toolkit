instance creation
uniqueInstance
	self = TkPlatform 
		ifTrue: [ self error: 'I''m abstract. Use one of my children' ].
	^ uniqueInstance ifNil: [ uniqueInstance := self basicNew initialize ]