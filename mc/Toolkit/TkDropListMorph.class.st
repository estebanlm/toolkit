"
I show a dropdown morph that allows an user to choose between a list of options.
"
Class {
	#name : #TkDropListMorph,
	#superclass : #MADropListMorph,
	#instVars : [
		'listModel'
	],
	#category : 'Toolkit-Magritte-Morphic'
}

{ #category : #actions }
TkDropListMorph >> add [
	| object |
	
	object := (TkMagritteEditor 
		object: self magritteDescription tkReferenceClass new
		presenter: #create)
		go.
	object ifNil: [ ^ self ].
	self magritteDescription tkWhenCreated value: object.
	self magritteDescription options: (self magritteDescription options copyWith: object).
	listModel 
		items: self options;
		setSelectedItem: object.
	self value: object
]

{ #category : #private-building }
TkDropListMorph >> buildAddButtonMorph [
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
TkDropListMorph >> buildListMorph [
	| options |
	
	self flag: #workaround. "The call to #yourself will force a voyage proxy to be solved. 
	This problem seems to be happening because when setting the selected item the search for 
	it (using #included:) does not triggers the proxy definition."
	self value yourself.
	options := self options.
	listModel := DropListModel new.
	listModel
		items: options;
		displayBlock: [ :element | 
			element
				ifNotNil: [ self magritteDescription reference toString: element ]
				ifNil: [ '' ] ];
		setSelectedItem: self value;
		whenSelectedItemChanged: [ :e | self value: e ].
	
	"Set start value"
	(options notEmpty and: [ self value isNil ]) ifTrue: [ 
		self memento 
			write: options first 
			using: self magritteDescription ].
	
	^ listModel buildWithSpec.		
]

{ #category : #private-building }
TkDropListMorph >> buildMorphEditor [
	^ PanelMorph new
		changeTableLayout;
		listDirection: #leftToRight;
		cellInset: 3;
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		addMorph: self buildAddButtonMorph;
		addMorph: self buildListMorph;
		yourself	
]

{ #category : #private-building }
TkDropListMorph >> buildMorphView [
	self magritteDescription isReadonly 
		ifTrue: [ ^ self buildMorphReadonly ].
	^ self buildMorphEditor
]
