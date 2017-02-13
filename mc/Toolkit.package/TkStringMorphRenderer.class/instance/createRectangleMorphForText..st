private factory
createRectangleMorphForText: aTextMorph
	"Since twity does not includes any 'frame' for their elements, I need to wrap them into a 
	 morph who does the job."
	^ BorderedMorph new
		borderWidth: 1;
		borderColor: Smalltalk ui theme borderColor;
		color: Smalltalk ui theme backgroundColor;
		layoutPolicy: ProportionalLayout new;
		cellInset: 4;
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		addMorph: aTextMorph fullFrame: LayoutFrame identity;
		yourself