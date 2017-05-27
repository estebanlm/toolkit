private
toggleState
	self isPressed
		ifTrue: [ self releaseButton ]
		ifFalse: [ self pressButton ]