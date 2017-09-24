"
I'm a toggle action (an on/off operation). 
I'm used on toolbars to indicate flag activations.
"
Class {
	#name : #TkToggleAction,
	#superclass : #TkExtentedAction,
	#instVars : [
		'state',
		'pressedIcon',
		'unpressedIcon'
	],
	#category : 'Toolkit-Glamour-Presentation'
}

{ #category : #'public interface' }
TkToggleAction >> actOn: aPresentation [	 
	^ self action glamourValueWithArgs: 
		{ aPresentation }, 
		aPresentation entity asGlamorousArray, 
		{ self isPressed }
]

{ #category : #'public interface' }
TkToggleAction >> actOn: aPresentation from: aButton [
	self toggleState.
	aButton 
		label: (AlphaImageMorph new image: self icon);
		changed.
	self actOn: aPresentation
]

{ #category : #accessing }
TkToggleAction >> icon [ 
	^ icon ifNil: [ 
		self releaseButton. "By default is released"
		icon ]
]

{ #category : #initialization }
TkToggleAction >> initialize [
	super initialize.
	state := false.
]

{ #category : #testing }
TkToggleAction >> isPressed [
	^ state
		
]

{ #category : #private }
TkToggleAction >> pressButton [
	state := true.
	icon := self pressedIcon.	
]

{ #category : #accessing }
TkToggleAction >> pressedIcon [
	^ pressedIcon ifNil: [ pressedIcon := self unpressedIcon darker: 0.5 ]
]

{ #category : #accessing }
TkToggleAction >> pressedIcon: anObject [
	pressedIcon := anObject
]

{ #category : #private }
TkToggleAction >> releaseButton [
	state := false.
	icon := self unpressedIcon.
]

{ #category : #accessing }
TkToggleAction >> state: aBoolean [
	aBoolean 
		ifTrue: [ self pressButton ]
		ifFalse: [ self releaseButton ].
	
]

{ #category : #private }
TkToggleAction >> toggleState [
	self isPressed
		ifTrue: [ self releaseButton ]
		ifFalse: [ self pressButton ]
]

{ #category : #accessing }
TkToggleAction >> unpresedIcon: anObject [
	unpressedIcon := anObject
]

{ #category : #accessing }
TkToggleAction >> unpressedIcon [
	^ unpressedIcon
]
