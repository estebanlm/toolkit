change reporting
invalidRect: aRectangle from: aMorph
	self setNeedsDisplay.
	damageRecorder recordInvalidRect: aRectangle from: aMorph