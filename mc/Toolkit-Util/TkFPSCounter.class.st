Class {
	#name : #TkFPSCounter,
	#superclass : #Model,
	#instVars : [
		'lastFPS',
		'lastTime'
	],
	#category : 'Toolkit-Util'
}

{ #category : #'class initialization' }
TkFPSCounter class >> initialize [
	Smalltalk at: #FPS put: self new
]

{ #category : #executing }
TkFPSCounter >> executeOn: aBlock [ 
	| start end lastTime |
	start := Time millisecondClockValue.
	aBlock value.
	end := Time millisecondClockValue.
	lastTime := end - start.
	self lastTime: lastTime.
	lastTime = 0
		ifTrue: [ self lastFPS: nil ]
		ifFalse: [ self lastFPS: (1000/lastTime) ceiling ]
]

{ #category : #accessing }
TkFPSCounter >> lastFPS [
	^ 'FPS: ', (lastFPS ifNil: [0]) asString
]

{ #category : #accessing }
TkFPSCounter >> lastFPS: aNumber [
	lastFPS := aNumber.
	self changed: #lastFPS
]

{ #category : #accessing }
TkFPSCounter >> lastTime [
	^ 'Time: ', lastTime asString, 'ms'
]

{ #category : #accessing }
TkFPSCounter >> lastTime: aNumber [
	lastTime := aNumber.
	self changed: #lastTime
]

{ #category : #opening }
TkFPSCounter >> open [
	^ self openLabel: 'FPS Counter'
]

{ #category : #opening }
TkFPSCounter >> openLabel: aString [
	| window contents |
	
	window := (SystemWindow labelled: aString) 
		"model: self;"
		extent: 250@80;
		yourself.
	contents := PanelMorph new
		changeTableLayout;
		yourself.
		
	contents addMorph: ((PluggableTextFieldMorph on: self text: #lastTime accept: nil)
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		enabled: false;
		yourself).
	contents addMorph: ((PluggableTextFieldMorph on: self text: #lastFPS accept: nil)
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		enabled: false;
		yourself).

	window addMorph: contents frame: LayoutFrame identity.
	
	^ window openAsIs
]
