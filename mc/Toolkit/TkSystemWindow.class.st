Class {
	#name : #TkSystemWindow,
	#superclass : #GLMSystemWindow,
	#instVars : [
		'toolbarMorph',
		'contentMorph'
	],
	#category : 'Toolkit-Glamour-Morphic'
}

{ #category : #activation }
TkSystemWindow >> activate [
	super activate.
	self toolbarMorph ifNotNil: [ 
		self toolbarMorph fillStyle: self toolbarMorph normalFillStyle ]
]

{ #category : #accessing }
TkSystemWindow >> addContentMorph: aMorph [
	^ self addContentMorph: aMorph fullFrame: LayoutFrame identity
]

{ #category : #accessing }
TkSystemWindow >> addContentMorph: aMorph fullFrame: aFrame [
	self contentMorph ifNotNil: [ 
		self removeMorph: self contentMorph ].
	contentMorph := aMorph.
	^ self addMorph: aMorph fullFrame: aFrame
]

{ #category : #accessing }
TkSystemWindow >> contentMorph [
	^ contentMorph
]

{ #category : #accessing }
TkSystemWindow >> contentMorph: anObject [
	contentMorph := anObject
]

{ #category : #open/close }
TkSystemWindow >> delete [
	| willClose |

	(willClose := WindowWillClose new) 
		window: self;
		yourself.
	self announce: willClose.
	willClose canClose ifFalse: [ ^ self ].
	super delete

]

{ #category : #accessing }
TkSystemWindow >> disable [ 
	"Adds a 'disabling' morph on top"
	self isEnabled ifFalse: [ ^ self ].
	
	self releaseFocusIfContained.
	self contentMorph addMorphFront: (Morph new
		color: (self theme backgroundColor alpha: 0.5);
		layoutFrame: LayoutFrame identity;
		hResizing: #spaceFill; 
		vResizing: #spaceFill;
		setProperty: #disabledArea toValue: true;
		beSticky;
		yourself)
]

{ #category : #accessing }
TkSystemWindow >> enable [ 
	"Assumes that frst morph is a disabling morph and removes it"
	self isEnabled ifTrue: [ ^ self ].
	self contentMorph submorphs first delete

]

{ #category : #initialization }
TkSystemWindow >> initialize [
	super initialize.
	self 
		layoutPolicy: ProportionalLayout new;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		borderWidth: 0
]

{ #category : #testing }
TkSystemWindow >> isEnabled [
	^ self contentMorph submorphs isEmpty 
		or: [ ((self contentMorph submorphs first valueOfProperty: #disabledArea) = true) not ]
]

{ #category : #activation }
TkSystemWindow >> passivate [
	super passivate.
	self toolbarMorph ifNotNil: [ 
		self toolbarMorph fillStyle: (self theme windowInactiveFillStyleFor: self toolbarMorph) ]
]

{ #category : #accessing }
TkSystemWindow >> rootWindow [
	^ self root window
]

{ #category : #open/close }
TkSystemWindow >> tkOpen [
	super tkOpen.
	self announce: (WindowOpened new window: self)	
]

{ #category : #accessing }
TkSystemWindow >> toolbarMorph [
	^ toolbarMorph
]

{ #category : #accessing }
TkSystemWindow >> toolbarMorph: anObject [
	toolbarMorph := anObject
]
