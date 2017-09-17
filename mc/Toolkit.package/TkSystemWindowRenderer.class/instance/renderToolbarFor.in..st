rendering
renderToolbarFor: aRenderable in: aWindow
	| toolbarMorph |
	toolbarMorph := self renderToolbarForPresentation: aRenderable inMorph: aWindow.
	window toolbarMorph: toolbarMorph.
	^ aRenderable toolbarPosition 
		addToolbar: toolbarMorph
		size: self toolbarSize 
		to: aWindow