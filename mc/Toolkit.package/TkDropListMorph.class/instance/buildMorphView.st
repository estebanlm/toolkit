private-building
buildMorphView
	self magritteDescription isReadonly 
		ifTrue: [ ^ self buildMorphReadonly ].
	^ self buildMorphEditor