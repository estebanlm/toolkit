rendering
newSystemWindow: aRenderable
	| newWindow |
	newWindow := TkMiniWindow new model: aRenderable.
	newWindow 
		on: #keyStroke 
		send: #handleKeyStroke: 
		to: newWindow.
	^ newWindow