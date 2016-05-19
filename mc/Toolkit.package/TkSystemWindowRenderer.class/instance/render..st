rendering
render: aRenderable
	window := self newSystemWindow: aRenderable.
	
	self installActionsOnModel: window fromPresentation: aRenderable .
	self installKeystrokeActionsOnMorph: window fromPresentation: aRenderable.
	
	self basicRender: aRenderable.
	
	^ window