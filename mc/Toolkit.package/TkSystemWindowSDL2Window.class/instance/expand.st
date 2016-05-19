actions
expand
	self isMaximized
		ifTrue: [ self restore ]
		ifFalse: [ self maximize ]