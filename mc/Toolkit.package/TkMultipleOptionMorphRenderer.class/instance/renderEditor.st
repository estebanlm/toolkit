rendering
renderEditor
	| panelMorph |
	
	panelMorph := self createPanelMorph
		addMorphBack: self createListMorph;
		addMorphBack: self createButtonBar;
		yourself.
		
	morph addMorphBack: panelMorph