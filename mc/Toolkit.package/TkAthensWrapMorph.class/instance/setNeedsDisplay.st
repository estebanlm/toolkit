change reporting
setNeedsDisplay
	needsDisplay ifTrue: [ ^ self ].
	needsDisplay := true.
	OSWindowRenderThread enqueueOperation: [ 
		self renderer 
			ifNotNil: [ self redraw ] ].