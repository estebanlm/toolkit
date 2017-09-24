"
I'm a generator for select one object from a list. 
Instead generate a new object, I just pick one from provided list.
"
Class {
	#name : #TkGlamourSelectingEditor,
	#superclass : #TkGlamourEditor,
	#instVars : [
		'title',
		'list',
		'listTitle',
		'listDescription',
		'readOnly'
	],
	#category : 'Toolkit-Editor'
}

{ #category : #defaults }
TkGlamourSelectingEditor class >> defaultListTitle [
	^ 'All'
]

{ #category : #building }
TkGlamourSelectingEditor >> addObjectsMenuOn: aList [
	"By default, I do not add actions"
]

{ #category : #accessing }
TkGlamourSelectingEditor >> beReadOnly [
	readOnly := true
]

{ #category : #building }
TkGlamourSelectingEditor >> buildBrowser [
	| browser |
	
	browser := GLMTabulator new 
		title: [ self title ];
		initialExtent: self preferredExtent;
		row: [ :row |
			row 
				column: #objects;
				column: #currentObject ];
		row: #actions size: 35;
		yourself.
		
	browser transmit 
		to: #objects;
		andShow: [ :a | self buildObjectsOn: a ].
		
	browser transmit
		from: #objects;
		to: #currentObject;
		andShow: [ :a | self buildCurrentObjectOn: a ].
	
	self buildActionsOn: browser.
	
	^ browser
]

{ #category : #building }
TkGlamourSelectingEditor >> buildCurrentObjectOn: a [
	a tkMagritte 
		title: [ :object | self titleFor: object ];
		presenter: #view;
		in: [ :this | self isReadOnly ifTrue: [ this beReadOnly ] ]
]

{ #category : #building }
TkGlamourSelectingEditor >> buildObjectsOn: aPresenter [
	aPresenter fastList
		title: self listTitle;
		in: [ :this | self addObjectsMenuOn: this ];
		display: [ self list ];
		format: [ :object | self descriptionFor: object ].
]

{ #category : #factory }
TkGlamourSelectingEditor >> createObject [ 
	^ self value
]

{ #category : #private }
TkGlamourSelectingEditor >> descriptionFor: object [
	^ listDescription 
		ifNotNil: [ listDescription value: object ]
		ifNil: [ object asString ]
]

{ #category : #initialization }
TkGlamourSelectingEditor >> initialize [
	super initialize.
	readOnly := false
]

{ #category : #testing }
TkGlamourSelectingEditor >> isReadOnly [ 
	^ readOnly
]

{ #category : #accessing }
TkGlamourSelectingEditor >> list [
	^ list
]

{ #category : #accessing }
TkGlamourSelectingEditor >> list: anObject [
	list := anObject
]

{ #category : #accessing }
TkGlamourSelectingEditor >> listDescription [
	^ listDescription
]

{ #category : #accessing }
TkGlamourSelectingEditor >> listDescription: anObject [
	listDescription := anObject
]

{ #category : #accessing }
TkGlamourSelectingEditor >> listTitle [
	^ listTitle ifNil: [ listTitle := self class defaultListTitle ]
]

{ #category : #accessing }
TkGlamourSelectingEditor >> listTitle: aString [
	listTitle := aString
]

{ #category : #accessing }
TkGlamourSelectingEditor >> startValue [
	^ self list
]

{ #category : #accessing }
TkGlamourSelectingEditor >> title [ 
	^ title ifNil: [ super title ]
]

{ #category : #accessing }
TkGlamourSelectingEditor >> title: aString [ 
	title := aString
]

{ #category : #private }
TkGlamourSelectingEditor >> titleFor: anObject [
	^ anObject name
]
