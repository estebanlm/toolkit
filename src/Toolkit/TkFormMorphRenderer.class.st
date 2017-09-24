Class {
	#name : #TkFormMorphRenderer,
	#superclass : #TkMorphRenderer,
	#instVars : [
		'visitor'
	],
	#category : 'Toolkit-Magritte-Renderer'
}

{ #category : #accessing }
TkFormMorphRenderer class >> labelExtent [
	"extent of a label (width and height). 
	 Height is necesary because a table layout will take the height of the first element as the default 
	 height and will format all rows to that."
	^ self labelWidth @ self rowHeight
]

{ #category : #accessing }
TkFormMorphRenderer class >> labelWidth [
	^ 100
]

{ #category : #'private factory' }
TkFormMorphRenderer >> createLabelMorphFor: aDescription [
	^ self createStringMorph
		contents: aDescription label;
		extent: self class labelExtent;
		yourself
]

{ #category : #'private factory' }
TkFormMorphRenderer >> createToolbarMorphFor: aDescription [
	^ self createRectangleMorph
		listDirection: #leftToRight;
		cellInset: 4@0;
		layoutInset: 4@4;
		in: [ :this | 
			aDescription magritteActionButtons 
				do: [ :each | this addMorphBack: each ] ];
		yourself.
	
]

{ #category : #rendering }
TkFormMorphRenderer >> renderEditor [

	self morph
		setBalloonText: self magritteDescription comment;
		listDirection: #topToBottom;
		cellInset: 3
		yourself.

	self model children do: [ :each | | elementMorph |
		elementMorph := self createRectangleMorph
			layoutInset: 1 @ 1;
			listDirection: #leftToRight;
			yourself.
		elementMorph addMorphBack: (self createLabelMorphFor: each magritteDescription).
		self 
			withModel: each 
			do: [ :renderer | each magritteDescription acceptMagritte: renderer ]
			on: elementMorph.
		each magritteDescription hasComment
			ifTrue: [ elementMorph setBalloonText: each comment ].
		self morph addMorphBack: elementMorph ].

	self morph addMorphBack: (self createToolbarMorphFor: self magritteDescription)
]

{ #category : #rendering }
TkFormMorphRenderer >> renderReadonly [
	self renderEditor
]

{ #category : #accessing }
TkFormMorphRenderer >> visitor [
	^ visitor
]

{ #category : #accessing }
TkFormMorphRenderer >> visitor: anObject [
	visitor := anObject
]

{ #category : #private }
TkFormMorphRenderer >> withModel: aModel do: aBlock on: aMorph [
	aBlock value: (self visitor copy 
		model: aModel;
		morph: aMorph;
		yourself).
		
	
]
