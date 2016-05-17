private-building
buildMorphView
	^ PanelMorph new
		changeTableLayout;
		listDirection: #leftToRight;
		cellInset: 3;
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		addMorph: self buildPickDateButtonMorph;
		addMorph: (textMorph := self buildDateMorphView);
		yourself