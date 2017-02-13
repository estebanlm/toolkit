private factory
createButtonBar
	^ self createPanelMorph
		addMorph: self createAddButtonMorph;
		addMorph: self createPickButtonMorph;
		yourself