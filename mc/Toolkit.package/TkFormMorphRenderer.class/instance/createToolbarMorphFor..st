private factory
createToolbarMorphFor: aDescription
	^ self createRectangleMorph
		listDirection: #leftToRight;
		cellInset: 4@0;
		layoutInset: 4@4;
		in: [ :this | 
			aDescription magritteActionButtons 
				do: [ :each | this addMorphBack: each ] ];
		yourself.
	