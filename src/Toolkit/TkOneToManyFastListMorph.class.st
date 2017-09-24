Class {
	#name : #TkOneToManyFastListMorph,
	#superclass : #MAOneToManyMorph,
	#instVars : [
		'listMorph'
	],
	#category : 'Toolkit-Magritte-Morphic'
}

{ #category : #actions }
TkOneToManyFastListMorph >> add [
	| object elements clazz |
	
	clazz := self classToAdd.
	clazz ifNil: [ ^ self ].	
	object := (TkMagritteEditor object: clazz new presenter: #create) go.
	object ifNil: [ ^ self ].
	self magritteDescription tkWhenCreated value: object.
	elements := self value copyWith: object.
	self value: elements.
	listMorph 
		elements: elements asArray;
		refresh
]

{ #category : #private-building }
TkOneToManyFastListMorph >> buildAddButtonMorph [
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
TkOneToManyFastListMorph >> buildButtonBar [
	^ PanelMorph new
		changeTableLayout;
		listDirection: #topToBottom;
		cellInset: 3;
		hResizing: #shrinkWrap;
		vResizing: #spaceFill;
		addMorph: self buildAddButtonMorph;
		yourself
]

{ #category : #private-building }
TkOneToManyFastListMorph >> buildEditButtonMorph: anObject [
	| editIcon |
	editIcon := self magritteDescription tkEditIcon.
	^ IconicButton new 
		color: Color transparent;
		labelGraphic: editIcon;
		helpText: (self magritteDescription tkEditHelpText localised 
			format: {  self magritteDescription reference toString: anObject });
		target: self;
		actionSelector: #edit:;
		arguments: { anObject };
		borderWidth: 0;
		extent: editIcon extent;
		wrapCentering: #center;
		yourself
]

{ #category : #private-building }
TkOneToManyFastListMorph >> buildListMorph [
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
]

{ #category : #private-building }
TkOneToManyFastListMorph >> buildMorphView [
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
]

{ #category : #private-building }
TkOneToManyFastListMorph >> buildObjectButtonBar: object [
	^ PanelMorph new
		changeTableLayout;
		listDirection: #leftToRight;
		cellInset: 1;
		hResizing: #shrinkWrap;
		vResizing: #spaceFill;
		addMorph: (self buildEditButtonMorph: object);
		addMorph: (self buildRemoveButtonMorph: object);
		yourself
		
]

{ #category : #private-building }
TkOneToManyFastListMorph >> buildRemoveButtonMorph: anObject [
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

{ #category : #private }
TkOneToManyFastListMorph >> classToAdd [
	^ self magritteDescription classes size = 1
		ifTrue: [ self magritteDescription classes anyOne ]
		ifFalse: [ self pickClass ]
]

{ #category : #actions }
TkOneToManyFastListMorph >> edit: anObject [
	| object |
	
	object := (TkMagritteEditor object: anObject presenter: #update) go.
	object ifNil: [ ^ self ].
	self magritteDescription tkWhenUpdated value: object.
	listMorph refresh
]

{ #category : #private-actions }
TkOneToManyFastListMorph >> pickClass [
	self notYetImplemented
]

{ #category : #actions }
TkOneToManyFastListMorph >> remove: anObject [
	| elements |
	elements := self value copyWithout: anObject.
	self value: elements.
	listMorph 
		elements: elements asArray;
		refresh
]
