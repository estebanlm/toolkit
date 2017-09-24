Class {
	#name : #TkMultiSelectFastListMorph,
	#superclass : #MAMultiSelectListMorph,
	#category : 'Toolkit-Magritte-Morphic'
}

{ #category : #actions }
TkMultiSelectFastListMorph >> add [
	| object elements |
	
	object := (TkMagritteEditor 
		object: self magritteDescription tkReferenceClass new
		presenter: #create)
		go.
	object ifNil: [ ^ self ].
	self magritteDescription tkWhenCreated value: object.
	self magritteDescription options: (self magritteDescription options copyWith: object).
	elements := self value copyWith: object.
	self value: elements.
	listMorph 
		elements: elements asArray;
		refresh
]

{ #category : #private-building }
TkMultiSelectFastListMorph >> buildAddButtonMorph [
	^ PluggableButtonMorph new 
		icon: self magritteDescription tkAddIcon;
		label: nil;
		helpText: self magritteDescription tkAddHelpText;
		model: self;
		action: #add;
		borderWidth: 0;
		yourself
]

{ #category : #private-building }
TkMultiSelectFastListMorph >> buildButtonBar [
	^ PanelMorph new
		changeTableLayout;
		listDirection: #topToBottom;
		cellInset: 3;
		hResizing: #shrinkWrap;
		vResizing: #spaceFill;
		addMorph: self buildAddButtonMorph;
		addMorph: self buildPickButtonMorph;
		yourself
]

{ #category : #private-building }
TkMultiSelectFastListMorph >> buildListMorph [
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
		"onAnnouncement: FTSelectionChanged do: [ :ann | ];"
		yourself.
	
]

{ #category : #private-building }
TkMultiSelectFastListMorph >> buildMorphView [
	^ PanelMorph new
		changeTableLayout;
		listDirection: #leftToRight;
		cellInset: 3;
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		addMorph: self buildButtonBar;
		addMorph: self buildListMorph;
		yourself
]

{ #category : #private-building }
TkMultiSelectFastListMorph >> buildPickButtonMorph [
	^ PluggableButtonMorph new 
		icon: self magritteDescription tkPickIcon;
		label: nil;
		helpText: self magritteDescription tkPickHelpText;
		model: self;
		action: #pickOne;
		borderWidth: 0;
		yourself
]

{ #category : #private-building }
TkMultiSelectFastListMorph >> buildRemoveButtonMorph: anObject [
	| removeIcon |
	removeIcon := self magritteDescription tkRemoveIcon.
	^ IconicButton new 
		color: Color transparent;
		labelGraphic: removeIcon;
		helpText: (self magritteDescription tkRemoveHelpText localised 
			format: {  self magritteDescription reference toString: anObject });
		target: self;
		actionSelector: #remove:;
		arguments: { anObject };
		borderWidth: 0;
		extent: removeIcon extent;
		wrapCentering: #center;
		yourself
]

{ #category : #actions }
TkMultiSelectFastListMorph >> pickOne [
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
]

{ #category : #actions }
TkMultiSelectFastListMorph >> remove: anObject [
	| elements |
	elements := self value copyWithout: anObject.
	self value: elements.
	listMorph 
		elements: elements asArray;
		refresh
]
