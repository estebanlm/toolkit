visiting
visitWindowCloseEvent: anEvent
	| willClose |
	
	anEvent suppressDefaultAction.
	
	(willClose := WindowWillClose new) 
		window: self window;
		"event: anEvent;"
		yourself.
	self announce: willClose.
	willClose canClose 
		ifTrue: [ self window close ]