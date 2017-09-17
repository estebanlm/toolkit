rendering
renderMiniBrowser: aRenderable
	^ aRenderable miniWindowRendererClass 
		render: aRenderable 
		from: aRenderable defaultRenderer 