private-building
buildListMorph
	| elements |
	elements := self value asArray.
	^ (listMorph := FTEasyListMorph new)
		elements: elements;
		display: [ :object | self magritteDescription reference toString: object ];
		in: [ :this | 
			self magritteDescription isReadonly 
				ifFalse: [ this icon: [ :object | self buildObjectButtonBar: object ] ] ];
		intercellSpacing: 1;
		hResizing: #spaceFill;
		borderColor: #inset; 
		borderWidth: 1;
		height: (listMorph rowHeight * self magritteDescription tkRowsToShow);
		"onAnnouncement: FTSelectionChanged do: [ :ann | ];"
		yourself.