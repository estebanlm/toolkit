drawing
redraw
	needsDisplay ifFalse: [ ^self ].
	FPS executeOn: [ 
		[ self redrawDamagedByRegion ]
		ensure: [ 
			damageRecorder reset.
			needsDisplay := false ] ]