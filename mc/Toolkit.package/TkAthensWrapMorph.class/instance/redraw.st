change reporting
redraw
	needsDisplay ifFalse: [ ^self ].
	[
		self renderer surface drawDuring: [ :canvas |
			canvas surface clear: Color white.
			self fullDrawOnAthensCanvas: canvas ].
		self renderer updateAll. ]
	ensure: [ needsDisplay := false ]