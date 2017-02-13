private factory
createLabelMorphFor: aDescription
	^ self createStringMorph
		contents: aDescription label;
		extent: self class labelExtent;
		yourself