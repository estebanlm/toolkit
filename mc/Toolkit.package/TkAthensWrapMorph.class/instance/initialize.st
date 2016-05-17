initialization
initialize 
	super initialize.
	needsDisplay := false.
	self 
		layoutPolicy: ProportionalLayout new;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		layoutInset: 0