drawing
redrawAll
	self renderer surface drawDuring: [ :canvas |
		canvas surface clear: Color white.
		self fullDrawOnAthensCanvas: canvas ].
	"self renderer updateAll."