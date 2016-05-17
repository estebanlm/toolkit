building
buildSelectCheckboxFor: anObject
	^ (CheckboxMorph new
		on: (TkSelectingModel owner: self object: anObject)
		selected: #state
		changeSelected: #state:)
		beCheckbox;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		yourself