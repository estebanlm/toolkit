private-building
buildButtonBar
	^ PanelMorph new
		changeTableLayout;
		listDirection: #topToBottom;
		cellInset: 3;
		hResizing: #shrinkWrap;
		vResizing: #spaceFill;
		addMorph: self buildAddButtonMorph;
		yourself