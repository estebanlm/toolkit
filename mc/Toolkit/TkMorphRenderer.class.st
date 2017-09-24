Class {
	#name : #TkMorphRenderer,
	#superclass : #Object,
	#instVars : [
		'morph',
		'model',
		'magritteDescription'
	],
	#category : 'Toolkit-Magritte-Renderer'
}

{ #category : #'instance creation' }
TkMorphRenderer class >> description: aDescription model: anObject [ on: aMorph
	^ self basicNew
		initializeDescription: aDescription 
			model: anObject 
			on: aMorph;
		yourself
]

{ #category : #accessing }
TkMorphRenderer class >> rowHeight [
	^ 24
]

{ #category : #'private factory' }
TkMorphRenderer >> createButtonMorph [
	^ PluggableButtonMorph new 
		label: nil;
		borderWidth: 0;
		yourself
]

{ #category : #'private factory' }
TkMorphRenderer >> createPanelMorph [
	^ PanelMorph new
		changeTableLayout;
		listDirection: #leftToRight;
		cellInset: 3;
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		yourself
]

{ #category : #'private factory' }
TkMorphRenderer >> createRectangleMorph [
	^ BorderedMorph new
		borderWidth: 0;
		color: Color transparent;
		layoutPolicy: TableLayout new;
		cellPositioning: #topLeft;
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		yourself
]

{ #category : #'private factory' }
TkMorphRenderer >> createStringMorph [
	^ StringMorph new
]

{ #category : #initialization }
TkMorphRenderer >> initializeDescription: aDescription model: anObject [ on: aMorph
	self initialize.
	magritteDescription := aDescription.
	model := anObject.
	morph := aMorph.

]

{ #category : #accessing }
TkMorphRenderer >> magritteDescription [
	^ magritteDescription
]

{ #category : #accessing }
TkMorphRenderer >> memento [
	^ self model memento
]

{ #category : #accessing }
TkMorphRenderer >> model [
	^ model
]

{ #category : #accessing }
TkMorphRenderer >> model: anObject [
	model := anObject
]

{ #category : #accessing }
TkMorphRenderer >> morph [
	^ morph
]

{ #category : #accessing }
TkMorphRenderer >> morph: anObject [
	morph := anObject
]

{ #category : #rendering }
TkMorphRenderer >> render [
	self magritteDescription isReadonly ifTrue: [ ^ self renderReadonly ].
	self renderEditor
]

{ #category : #rendering }
TkMorphRenderer >> renderEditor [
	self subclassResponsibility
]

{ #category : #rendering }
TkMorphRenderer >> renderReadonly [
	morph addMorphBack: (self createStringMorph 
		contents: self model string;
		yourself)
]

{ #category : #accessing }
TkMorphRenderer >> string [
	^ self model string
]

{ #category : #accessing }
TkMorphRenderer >> string: aString [
	^ self model string: aString
]

{ #category : #accessing }
TkMorphRenderer >> value [
	^ self model value
]

{ #category : #accessing }
TkMorphRenderer >> value: anObject [
	^ self model value: anObject
]
