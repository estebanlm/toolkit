"
I'm a morph model for single options. 
I work in assumption the model I will have is a TkDropListMorph... is very possible I will not work if model is another,
"
Class {
	#name : #TkSingleOptionModel,
	#superclass : #ComposableModel,
	#instVars : [
		'model',
		'magritteDescription',
		'list',
		'addButton'
	],
	#category : 'Toolkit-Magritte-Morphic'
}

{ #category : #specs }
TkSingleOptionModel class >> defaultSpec [
	<spec>

	^ SpecLayout composed 
		newRow: [ :row |
			row 
				add: #list;
				add: #addButton width: 22 ] height: self inputTextHeight
]

{ #category : #'instance creation' }
TkSingleOptionModel class >> model: aModel description: aDescription [
	^ self basicNew
		model: aModel; 
		magritteDescription: aDescription;
		initialize;
		yourself
]

{ #category : #'accessing ui' }
TkSingleOptionModel >> addButton [
	^ addButton
]

{ #category : #'accessing ui' }
TkSingleOptionModel >> addButton: anObject [
	addButton := anObject
]

{ #category : #private }
TkSingleOptionModel >> displayStringOf: item [
	^ item
		ifNotNil: [ self model magritteDescription reference toString: item ]
		ifNil: [ '' ]	
]

{ #category : #initialization }
TkSingleOptionModel >> initializePresenter [
	self list 
		items: self model options;
		displayBlock: [ :item | self displayStringOf: item ];
		setSelectedItem: self model value;
		whenSelectedItemChanged: [ :item | self model value: item ].
]

{ #category : #initialization }
TkSingleOptionModel >> initializeWidgets [
	list := self newDropList.
	addButton := self newButton.
	
	addButton 
		icon: self magritteDescription tkAddIcon;
		"helpText: self magritteDescription tkAddHelpText;"
		action: [ self model add ].
]

{ #category : #'accessing ui' }
TkSingleOptionModel >> list [
	^ list
]

{ #category : #'accessing ui' }
TkSingleOptionModel >> list: anObject [
	list := anObject
]

{ #category : #accessing }
TkSingleOptionModel >> magritteDescription [
	^ magritteDescription
]

{ #category : #accessing }
TkSingleOptionModel >> magritteDescription: anObject [
	magritteDescription := anObject
]

{ #category : #accessing }
TkSingleOptionModel >> model [
	^ model
]

{ #category : #accessing }
TkSingleOptionModel >> model: anObject [
	model := anObject
]
