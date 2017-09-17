accessing
addContentMorph: aMorph fullFrame: aFrame
	self contentMorph ifNotNil: [ 
		self removeMorph: self contentMorph ].
	contentMorph := aMorph.
	^ self addMorph: aMorph fullFrame: aFrame