private-building
buildMorphEditor
	^ PanelMorph new
		changeTableLayout;
		listDirection: #leftToRight;
		cellInset: 3;
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		addMorph: self buildAddButtonMorph;
		addMorph: self buildListMorph;
		yourself	