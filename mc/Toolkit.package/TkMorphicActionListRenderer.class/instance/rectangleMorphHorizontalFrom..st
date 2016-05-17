private
rectangleMorphHorizontalFrom: anActionListPresentation
	^ self rectangleMorph
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		listDirection: #leftToRight;
		listCentering: #bottomRight;
		wrapCentering: #bottomRight;
		cellInset: self defaultSpacerSize;
		yourself	