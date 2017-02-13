actions
chooseOne
	| element elements |
	
	element := TkGlamourSelectingEditor new
		title: self magritteDescription tkPickTitle;
		list: self options;
		listTitle: self magritteDescription tkPickListTitle;
		listDescription: self magritteDescription tkListingDescription;
		acceptIcon: self magritteDescription tkPickAcceptIcon;
		cancelIcon: self magritteDescription tkPickCancelIcon;
		go.
	element ifNil: [ ^ self ].
	elements := self value copyWith: element.
	self value: elements.
	listMorph 
		elements: elements asArray;
		refresh