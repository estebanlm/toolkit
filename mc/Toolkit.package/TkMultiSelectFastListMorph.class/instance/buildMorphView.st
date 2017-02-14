private-building
buildMorphView
	^ PanelMorph new
		changeTableLayout;
		listDirection: #leftToRight;
		cellInset: 3;
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		addMorph: self buildButtonBar;
		addMorph: self buildListMorph;
		yourself