rendering
newSystemWindow: aRenderable
	| newWindow |
	newWindow := GLMSystemWindow new model: aRenderable.
	newWindow 
		on: #keyStroke 
		send: #handleKeyStroke: 
		to: newWindow.
	^ newWindow