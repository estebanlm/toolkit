Class {
	#name : #TkAthensWrapMorph,
	#superclass : #AthensWrapMorph,
	#instVars : [
		'window',
		'renderer',
		'needsDisplay',
		'damageRecorder'
	],
	#category : 'Toolkit-SDL2'
}

{ #category : #'instance creation' }
TkAthensWrapMorph class >> window: aWindow [ 
	^ self basicNew 
		initializeWindow: aWindow;
		yourself
]

{ #category : #open/close }
TkAthensWrapMorph >> close [
	renderer := nil.
	window := nil.
	self delete.
]

{ #category : #private }
TkAthensWrapMorph >> createSurface [
	surface := window surface
]

{ #category : #accessing }
TkAthensWrapMorph >> fullBounds [ 
	^ 0@0 extent: self renderer surface extent
]

{ #category : #initialization }
TkAthensWrapMorph >> initialize [ 
	super initialize.
	needsDisplay := false.
	damageRecorder := DamageRecorder new.
	self 
		layoutPolicy: ProportionalLayout new;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		layoutInset: 0
]

{ #category : #initialization }
TkAthensWrapMorph >> initializeWindow: aWindow [
	window := aWindow.
	self initialize
]

{ #category : #'change reporting' }
TkAthensWrapMorph >> invalidRect: aRectangle from: aMorph [
	self setNeedsDisplay.
	damageRecorder recordInvalidRect: aRectangle from: aMorph
]

{ #category : #'change reporting' }
TkAthensWrapMorph >> needsDisplay [
	^ needsDisplay
]

{ #category : #drawing }
TkAthensWrapMorph >> redraw [
	needsDisplay ifFalse: [ ^self ].
	FPS executeOn: [ 
		[ self redrawDamagedByRegion ]
		ensure: [ 
			damageRecorder reset.
			needsDisplay := false ] ]
]

{ #category : #drawing }
TkAthensWrapMorph >> redrawAll [
	self renderer surface drawDuring: [ :canvas |
		canvas surface clear: Color white.
		self fullDrawOnAthensCanvas: canvas ].
	"self renderer updateAll."
]

{ #category : #drawing }
TkAthensWrapMorph >> redrawDamaged [
	| damaged |

	"If damages includes wrapped morph, then I need to redraw all"
	(damageRecorder invalidMorphs includes: self wrappedMorph)  
		ifTrue: [ ^ self redrawAll ].
		
	damaged := damageRecorder invalidMorphs copy.
	self renderer surface drawDuring: [ :canvas |
		damaged reverseDo: [ :each | canvas fullDrawMorph: each ] ]		 
		
]

{ #category : #drawing }
TkAthensWrapMorph >> redrawDamagedByRegion [
	| rects numRects |

	self redrawAll.
	rects := damageRecorder invalidRects.
	numRects := rects size.
	rects do: [ :each  |
		self renderer updateRectangle: self wrappedMorph bounds ]	
]

{ #category : #drawing }
TkAthensWrapMorph >> redrawDamagedOwners [
	"Same as damaged, but redraw owners (to ensure cleaning)"
	| damaged |

	"If damages includes wrapped morph, then I need to redraw all"
	(damageRecorder invalidMorphs includes: self wrappedMorph)  
		ifTrue: [ ^ self redrawAll ].
		
	damaged := damageRecorder invalidMorphs copy.
	self renderer surface drawDuring: [ :canvas |
		damaged reverseDo: [ :each | canvas fullDrawMorph: each owner ] ]
]

{ #category : #accessing }
TkAthensWrapMorph >> renderer [
	^ renderer
]

{ #category : #accessing }
TkAthensWrapMorph >> renderer: anObject [
	renderer := anObject
]

{ #category : #'change reporting' }
TkAthensWrapMorph >> setNeedsDisplay [
	needsDisplay ifTrue: [ ^ self ].
	needsDisplay := true.
	OSWindowRenderThread enqueueOperation: [ 
		self renderer 
			ifNotNil: [ self redraw ] ].
]

{ #category : #accessing }
TkAthensWrapMorph >> window [
	^ window
]

{ #category : #accessing }
TkAthensWrapMorph >> world [
	^ActiveWorld
]

{ #category : #accessing }
TkAthensWrapMorph >> wrap: aMorph [ 
	self 
		addMorph: aMorph
		fullFrame: LayoutFrame identity
]

{ #category : #private }
TkAthensWrapMorph >> wrappedMorph [
	^ self submorphs first
]
