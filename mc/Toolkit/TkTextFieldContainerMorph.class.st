Class {
	#name : #TkTextFieldContainerMorph,
	#superclass : #BorderedMorph,
	#instVars : [
		'textMorph'
	],
	#category : 'Toolkit-Magritte-Morphic'
}

{ #category : #'instance creation' }
TkTextFieldContainerMorph class >> new [
	self error: 'Use #textMorph:'
]

{ #category : #'instance creation' }
TkTextFieldContainerMorph class >> textMorph: aTextMorph [
	^ self basicNew 
		initializeTextMorph: aTextMorph;
		yourself
]

{ #category : #'event handling' }
TkTextFieldContainerMorph >> handlesMouseDown: anEvent [
	^ true
]

{ #category : #'event handling' }
TkTextFieldContainerMorph >> hasFocus [
	^ self textMorph hasFocus
]

{ #category : #'event handling' }
TkTextFieldContainerMorph >> hasKeyboardFocus [
	"Answer whether the receiver has keyboard focus."
	^ super hasKeyboardFocus
		or: [ self textMorph hasKeyboardFocus ]
]

{ #category : #initialization }
TkTextFieldContainerMorph >> initialize [
	super initialize.
	self
		borderColor: Smalltalk ui theme borderColor;
		color: Smalltalk ui theme backgroundColor;
		layoutPolicy: ProportionalLayout new;
		cellInset: 4;
		vResizing: #spaceFill;
		hResizing: #spaceFill.
]

{ #category : #initialization }
TkTextFieldContainerMorph >> initializeTextMorph: aTextMorph [
	self initialize.
	textMorph := aTextMorph.
	self addMorph: textMorph fullFrame: LayoutFrame identity 
]

{ #category : #'event handling' }
TkTextFieldContainerMorph >> mouseDown: evt [ 
	"Make this TextMorph be the keyboard input focus, if it isn't  
	already, and repond to the text selection gesture"
	self hasKeyboardFocus
		ifFalse: [ self textMorph takeKeyboardFocus ]
]

{ #category : #accessing }
TkTextFieldContainerMorph >> textMorph [
	^ textMorph
]

{ #category : #'event handling' }
TkTextFieldContainerMorph >> wantsKeyboardFocusFor: aSubmorph [
	^ aSubmorph wouldAcceptKeyboardFocus
	
]
