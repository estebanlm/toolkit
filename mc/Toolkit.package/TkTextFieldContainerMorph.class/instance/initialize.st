initialization
initialize
	super initialize.
	self
		borderColor: Smalltalk ui theme borderColor;
		color: Smalltalk ui theme backgroundColor;
		layoutPolicy: ProportionalLayout new;
		cellInset: 4;
		vResizing: #spaceFill;
		hResizing: #spaceFill.