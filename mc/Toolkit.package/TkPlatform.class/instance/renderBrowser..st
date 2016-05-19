rendering
renderBrowser: aRenderable
	^ aRenderable windowRendererClass 
		render: aRenderable 
		from: aRenderable defaultRenderer 