private
buildMorphView
	self magritteDescription isReadonly 
		ifTrue: [ ^ self buildMorphReadonly ].
	^ super buildMorphView