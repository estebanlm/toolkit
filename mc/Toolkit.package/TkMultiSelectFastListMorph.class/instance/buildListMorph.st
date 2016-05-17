private-building
buildListMorph
	| elements |
	elements := self value asArray.
	^ (listMorph := FTEasyListMorph new)
		elements: elements;
		display: [ :object | self magritteDescription reference toString: object ];
		icon: [ :object | self buildRemoveButtonMorph: object ];
		intercellSpacing: 1;
		hResizing: #spaceFill;
		borderColor: #inset; 
		borderWidth: 1;
		height: (listMorph rowHeight * self magritteDescription tkRowsToShow);
		onAnnouncement: FTSelectionChanged do: [ :ann | ];
		yourself.
	