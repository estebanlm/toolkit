drawing
redrawDamagedByRegion
	| rects numRects |

	self redrawAll.
	rects := damageRecorder invalidRects.
	numRects := rects size.
	rects do: [ :each  |
		self renderer updateRectangle: self wrappedMorph bounds ]	