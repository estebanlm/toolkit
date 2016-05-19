rendering
newSystemWindow: aRenderable
	| newWindow |
	newWindow := TkSystemWindow new model: aRenderable.
	newWindow 
		on: #keyStroke 
		send: #handleKeyStroke: 
		to: newWindow.
	^ newWindow