"
I'm a SDL2 wrapper for Morphs.
"
Class {
	#name : #TkMorphSDL2Window,
	#superclass : #TkSDL2Window,
	#instVars : [
		'rootMorph',
		'wrappedMorph',
		'dragRegion'
	],
	#category : 'Toolkit-SDL2'
}

{ #category : #examples }
TkMorphSDL2Window class >> exampleButton [
	"Displays a simple button"
	OSSDLMorphWindow root: ((SimpleButtonMorph newWithLabel: 'Testing')).
]

{ #category : #examples }
TkMorphSDL2Window class >> exampleCheckBox [
	"A checkbox"
	OSSDLMorphWindow root: ((CheckboxMorph 
		on: (ValueHolder new contents: true)
		selected: #contents
		changeSelected: #contents:)
		label: 'Show password';
		labelClickable: true;
		height: 25).
]

{ #category : #examples }
TkMorphSDL2Window class >> exampleFullWorld [
	"A full world window"
	OSSDLMorphWindow root: World.
]

{ #category : #examples }
TkMorphSDL2Window class >> exampleImage [
	| image |
	image := (World submorphs detect: [ :each | each class = ImageMorph ]) copy.
	OSSDLMorphWindow root: image.

]

{ #category : #examples }
TkMorphSDL2Window class >> exampleLayout [
	"A window split in two buttons"
	OSSDLMorphWindow root: (Morph new 
		layoutPolicy: TableLayout new;
		cellPositioning: #topLeft;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		addMorph: (SimpleButtonMorph newWithLabel: 'test 1');
		addMorph: (SimpleButtonMorph newWithLabel: 'test 2');
		yourself).

]

{ #category : #examples }
TkMorphSDL2Window class >> exampleMenu [

	OSSDLMorphWindow root: (ActiveWorld worldMenu copy;
		yourself).

]

{ #category : #'instance creation' }
TkMorphSDL2Window class >> root: aMorph [ 
	^ self basicNew 
		initializeRoot: aMorph;
		yourself
]

{ #category : #'instance creation' }
TkMorphSDL2Window class >> root: aMorph position: aPosition [
	^ self basicNew 
		initializeRoot: aMorph atPosition: aPosition;
		yourself
]

{ #category : #accessing }
TkMorphSDL2Window >> beDraggable [
	self beDraggableRegion: self rootMorph bounds.
]

{ #category : #accessing }
TkMorphSDL2Window >> beDraggableRegion: aRectangle [
	| version |
	version := SDL_Version new.
	SDL2 getVersion: version.
	
	dragRegion := aRectangle.	
	"Only working for SDL 2.0.4 and above"
	(version major >= 2) & (version minor >= 0) & (version patch >= 4) ifTrue: [
		self setDraggableArea: dragRegion.
		self toggleBorderOff ]
]

{ #category : #showing }
TkMorphSDL2Window >> close [ 
	rootMorph delete.
	rootMorph := nil.
	wrappedMorph close.
	self destroy.
]

{ #category : #initialization }
TkMorphSDL2Window >> createSDLWindowAttributes [
	^ OSWindowAttributes new 
		preferableDriver: OSSDL2Driver current;
		borderless: true;
		resizable: false;
		bounds: (0@0 extent: self rootMorph extent);
		visible: false;
		yourself
]

{ #category : #accessing }
TkMorphSDL2Window >> extent: aPoint [
	wrappedMorph extent: aPoint.
	super extent: aPoint
]

{ #category : #accessing }
TkMorphSDL2Window >> initialExtent [
	^ 600@400
]

{ #category : #initialization }
TkMorphSDL2Window >> initializeEventHandler [
	self eventHandler: (TkMorphSDL2EventHandler for: self rootMorph)
]

{ #category : #initialization }
TkMorphSDL2Window >> initializeRoot: aMorph [ 
	rootMorph := aMorph.
	self initializeSDLWindow.
	self initializeWrappedMorph.
	self initialize

]

{ #category : #initialization }
TkMorphSDL2Window >> initializeSDLWindow [
	self initWithAttributes: self createSDLWindowAttributes.
	self renderer: self newAthensRenderer.
]

{ #category : #initialization }
TkMorphSDL2Window >> initializeWrappedMorph [
	wrappedMorph := (TkAthensWrapMorph window: self) 
		wrap: rootMorph;
		renderer: self renderer;
		yourself.
	wrappedMorph bounds: self bounds.		
	wrappedMorph setNeedsDisplay.
]

{ #category : #accessing }
TkMorphSDL2Window >> rootMorph [
	^ rootMorph
]

{ #category : #accessing }
TkMorphSDL2Window >> rootWindow [
	"I'm always root"
	^ self
]

{ #category : #accessing }
TkMorphSDL2Window >> title [
	^ self rootMorph asString
]
