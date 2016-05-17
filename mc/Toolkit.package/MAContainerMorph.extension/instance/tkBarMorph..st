*Toolkit-Magritte-decorating
tkBarMorph: anArray
	| bar |
	bar := self rectangleMorph
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		listDirection: #leftToRight;
		listCentering: #bottomRight;
		wrapCentering: #bottomRight;
		cellInset: self defaultSpacerSize;
		yourself.
	anArray do: [ :anAction |
		bar addMorphBack: anAction tkButtonMorph ].
	^ bar