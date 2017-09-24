"
I'm an abstract SDL2 window.
"
Class {
	#name : #TkSDL2Window,
	#superclass : #OSWindow,
	#instVars : [
		'surface',
		'sdlSurface',
		'sdlHandle'
	],
	#pools : [
		'SDL2Constants'
	],
	#category : 'Toolkit-SDL2'
}

{ #category : #examples }
TkSDL2Window class >> example1 [
	" 
	This example demostrates that same path could be reused multiple times when drawing.
	First, we creating a path, and later we can use it in #drawShape: command.
	self example1
	"

	| surf path window |
	
	window := self openLabel: 'Example 1' x:0 y: 0 width: 300 height: 300.
	surf := window surface.
	
	path := surf createRectanglePath: (0@ 0 corner: 20@ 20).
	
	surf drawDuring: [:can |
		surf clear: Color white.
		can pathTransform loadIdentity.
		can setPaint: (Color red).
		can pathTransform translateX: 5 Y: 5.
		can drawShape: path.
		can setPaint: (Color blue).
		can pathTransform translateX: 5 Y: 5.
		can drawShape: path.
	].

	window updateSurface.
	"Display getCanvas drawImage: 	surf asForm  at: 0@0"
	"window inspect."

]

{ #category : #examples }
TkSDL2Window class >> example2 [
" 
Draw simple filled path, changing the transformation and colors to get some animated effects.

 self example2
"
	| surface window |
	
	window := self openLabel: 'Example 1' x: 0 y: 0 width: 500 height: 500.
	surface := window surface.
	surface drawDuring: [:canvas | | path |
		surface clear: Color white.
		canvas setPaint: Color blue.

		canvas pathTransform translateX: 200 Y: 200.	
		canvas pathTransform scaleBy: 6.
		path := canvas createPath: [ :pathbuilder |
			pathbuilder 
				absolute;
				moveTo: -25 @ -25;
				curveVia: 25@ -25 to: 25@25;
				curveVia: -25@25 to: -25@ -25 ].
		
			1 to: 1000 do: [:i |
				canvas setPaint: Color random.
				canvas pathTransform restoreAfter: [
					canvas pathTransform rotateByDegrees: i*5.
					canvas pathTransform scaleBy: (1- ( i/2000)).
					canvas drawShape: path.
				].
				window updateSurface ] ].
	"window inspect."
]

{ #category : #examples }
TkSDL2Window class >> exampleTiger [
" 
 self exampleTiger
"
	OSSDLTigerDemo new runDemo
]

{ #category : #'instance creation' }
TkSDL2Window class >> new [
	self error: 'Use #openLabel:x:y:width:height:'
]

{ #category : #'instance creation' }
TkSDL2Window class >> openLabel: title width: w height: h [
	^ self 
		openLabel: title 
		x: SDL_WINDOWPOS_UNDEFINED
		y: SDL_WINDOWPOS_UNDEFINED
		width: w 
		height: h
]

{ #category : #'instance creation' }
TkSDL2Window class >> openLabel: title x: x y: y width: w height: h [
	^ self createWithAttributes: (OSWindowAttributes new 
		title: title;
		bounds: (x@y extent: w@h);
		preferableDriver: OSSDL2Driver current;
		yourself)
]

{ #category : #announcing }
TkSDL2Window >> announce: anAnnouncement [ 
	self announcer announce: anAnnouncement.
]

{ #category : #announcing }
TkSDL2Window >> announcer [ 
	^ self eventHandler announcer
]

{ #category : #showing }
TkSDL2Window >> close [ 
	self announce: (WindowClosed new
		window: self;
		yourself).
	self destroy
]

{ #category : #initialization }
TkSDL2Window >> initialize [ 
	super initialize.
	self initializeEventHandler
]

{ #category : #initialization }
TkSDL2Window >> initializeEventHandler [
	self eventHandler: (TkSDL2EventHandler new
		window: self;
		yourself)
]

{ #category : #private }
TkSDL2Window >> sdlHandle [
	^ sdlHandle ifNil: [ sdlHandle := self validHandle handle ]
]

{ #category : #private }
TkSDL2Window >> sdlSurface [
	^ sdlSurface ifNil: [ sdlSurface := self sdlHandle getWindowSurface ]
]

{ #category : #accessing }
TkSDL2Window >> sdlSurface: anObject [
	^ sdlSurface := anObject
]

{ #category : #accessing }
TkSDL2Window >> surface [
	^ surface ifNil: [ surface := AthensCairoSDLSurface fromSDLSurface: self sdlSurface ]
]

{ #category : #accessing }
TkSDL2Window >> surface: anObject [
	^ surface := anObject
]

{ #category : #accessing }
TkSDL2Window >> updateSurface [
	^ self sdlHandle updateWindowSurface
]

{ #category : #accessing }
TkSDL2Window >> updateSurfaceRects: rects num: numrects [
	^ self sdlHandle updateWindowSurfaceRects: rects num: numrects
]

{ #category : #announcing }
TkSDL2Window >> when: anAnnouncement do: aBlock [ 
	self announcer when: anAnnouncement do: aBlock 
]

{ #category : #announcing }
TkSDL2Window >> when: anAnnouncement send: aSelector [ to: aTarger
	self announcer when: anAnnouncement send: aSelector to: aTarger
]
