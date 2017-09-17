rendering
renderTinyBrowser: aRenderable
	^ aRenderable windowRendererClass 
		render: aRenderable 
		from: aRenderable defaultRenderer 