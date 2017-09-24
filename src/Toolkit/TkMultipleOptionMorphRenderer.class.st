Class {
	#name : #TkMultipleOptionMorphRenderer,
	#superclass : #TkMorphRenderer,
	#instVars : [
		'listMorph'
	],
	#category : 'Toolkit-Magritte-Renderer'
}

{ #category : #actions }
TkMultipleOptionMorphRenderer >> add [
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

{ #category : #actions }
TkMultipleOptionMorphRenderer >> chooseOne [
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

{ #category : #'private factory' }
TkMultipleOptionMorphRenderer >> createAddButtonMorph [
	^ PluggableButtonMorph new 
		icon: self magritteDescription tkAddIcon;
		label: nil;
		helpText: self magritteDescription tkAddHelpText;
		model: self;
		action: #add;
		borderWidth: 0;
		yourself
]

{ #category : #'private factory' }
TkMultipleOptionMorphRenderer >> createButtonBar [
	^ self createPanelMorph
		addMorph: self createAddButtonMorph;
		addMorph: self createPickButtonMorph;
		yourself
]

{ #category : #'private factory' }
TkMultipleOptionMorphRenderer >> createListMorph [
	| elements |
	elements := self model value asArray.
	^ (listMorph := FTEasyListMorph new)
		elements: elements;
		display: [ :object | self magritteDescription reference toString: object ];
		icon: [ :object | self createRemoveButtonMorph: object ];
		intercellSpacing: 1;
		hResizing: #spaceFill;
		borderColor: #inset; 
		borderWidth: 1;
		height: (listMorph rowHeight * self magritteDescription tkRowsToShow);
		"onAnnouncement: FTSelectionChanged do: [ :ann | ];"
		yourself.
	
]

{ #category : #'private factory' }
TkMultipleOptionMorphRenderer >> createPickButtonMorph [
	^ PluggableButtonMorph new 
		icon: self magritteDescription tkPickIcon;
		label: nil;
		helpText: self magritteDescription tkPickHelpText;
		model: self;
		action: #chooseOne;
		borderWidth: 0;
		yourself
]

{ #category : #'private factory' }
TkMultipleOptionMorphRenderer >> createRemoveButtonMorph: anObject [
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

{ #category : #accessing }
TkMultipleOptionMorphRenderer >> options [ 
	^ self model options
]

{ #category : #actions }
TkMultipleOptionMorphRenderer >> remove: anObject [
	| elements |
	elements := self value copyWithout: anObject.
	self value: elements.
	listMorph 
		elements: elements asArray;
		refresh
]

{ #category : #rendering }
TkMultipleOptionMorphRenderer >> renderEditor [
	| panelMorph |
	
	panelMorph := self createPanelMorph
		addMorphBack: self createListMorph;
		addMorphBack: self createButtonBar;
		yourself.
		
	morph addMorphBack: panelMorph
]
