private-building
buildMorphView
	^ PanelMorph new
		changeTableLayout;
		listDirection: #leftToRight;
		cellInset: 3;
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		in: [ :this | 
			self magritteDescription isReadonly 
				ifFalse: [ this addMorph: self buildButtonBar ] ];
		addMorph: self buildListMorph;
		yourself