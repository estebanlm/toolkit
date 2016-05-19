private-building
buildObjectButtonBar: object
	^ PanelMorph new
		changeTableLayout;
		listDirection: #leftToRight;
		cellInset: 1;
		hResizing: #shrinkWrap;
		vResizing: #spaceFill;
		addMorph: (self buildEditButtonMorph: object);
		addMorph: (self buildRemoveButtonMorph: object);
		yourself
		