private
buildMorphView
	| listMorph elements |
	elements := self strings.
	^ (listMorph := FTEasyListMorph new)
		elements: elements;
		hResizing: #spaceFill;
		borderColor: #inset; 
		borderWidth: 1;
		height: (listMorph rowHeight * self magritteDescription tkRowsToShow);
		selectRowIndexes: (self selected > 0 
			ifTrue: [ { elements at: self selected } ] 
			ifFalse: [ #() ]);  
		onAnnouncement: FTSelectionChanged 
			do: [ :ann | self selected: (elements at: ann newSelectedRowIndexes first) ];
		yourself.
	