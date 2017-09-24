"
I'm an SDL2 wrapper for SystemWindow.
"
Class {
	#name : #TkSystemWindowSDL2Window,
	#superclass : #TkMorphSDL2Window,
	#instVars : [
		'menuList'
	],
	#category : 'Toolkit-SDL2'
}

{ #category : #actions }
TkSystemWindowSDL2Window >> center [ 
	self validHandle position: SDL_WINDOWPOS_CENTERED@SDL_WINDOWPOS_CENTERED
]

{ #category : #initialization }
TkSystemWindowSDL2Window >> createSDLWindowAttributes [
	^ OSWindowAttributes new 
		preferableDriver: OSSDL2Driver current;
		title: self title;
		bounds: (0@0 extent: (self initialExtent max: self rootMorph extent));
		visible: false;
		yourself
]

{ #category : #private }
TkSystemWindowSDL2Window >> destroy [
	"Ensuring the window is valid before, because I'm most likely sending twice the #close message. 
	 I need to be sure the window is being disposed also when child window is deleted (see 
	 #prepareRootMorph and #close methods)"
	self isValid ifFalse: [ ^ self ].
	^ super destroy
]

{ #category : #accessing }
TkSystemWindowSDL2Window >> dragArea [
	^ dragRegion
]

{ #category : #accessing }
TkSystemWindowSDL2Window >> dragArea: anObject [
	dragRegion := anObject
]

{ #category : #actions }
TkSystemWindowSDL2Window >> expand [
	self isMaximized
		ifTrue: [ self restore ]
		ifFalse: [ self maximize ]
]

{ #category : #updating }
TkSystemWindowSDL2Window >> forceUpdate [
	self renderer resetResources.
	wrappedMorph setNeedsDisplay.
]

{ #category : #accessing }
TkSystemWindowSDL2Window >> initialExtent [
	^ self rootMorph extent
]

{ #category : #initialization }
TkSystemWindowSDL2Window >> initializeEventHandler [
	self eventHandler: ((TkSystemWindowSDL2EventHandler for: self rootMorph)
		window: self;
		yourself)
]

{ #category : #initialization }
TkSystemWindowSDL2Window >> initializeSDLWindow [
	menuList := OrderedCollection new.
	super initializeSDLWindow.
	self prepareSystemWindow.
	
]

{ #category : #initialization }
TkSystemWindowSDL2Window >> initializeWrappedMorph [
	super initializeWrappedMorph.
	wrappedMorph bounds: ActiveWorld bounds
]

{ #category : #testing }
TkSystemWindowSDL2Window >> isMaximized [
	^ (self getFlags bitAnd: SDL_WINDOW_MAXIMIZED) = SDL_WINDOW_MAXIMIZED
]

{ #category : #testing }
TkSystemWindowSDL2Window >> isMinimized [
	^ (self getFlags bitAnd: SDL_WINDOW_MINIMIZED) = SDL_WINDOW_MINIMIZED
]

{ #category : #testing }
TkSystemWindowSDL2Window >> isRestored [
	"Answer whether we are neither expanded or collapsed."
	^(self isMinimized or: [self isMaximized]) not
]

{ #category : #accessing }
TkSystemWindowSDL2Window >> menuList [
	^ menuList
]

{ #category : #initialization }
TkSystemWindowSDL2Window >> prepareSystemWindow [
	self rootMorph 
		"extent: self rootMorph initialExtent;"
		beSticky;
		beUnresizeable;
		removeBoxes;
		removeLabelArea.
		
	self rootMorph announcer 
		when: WindowClosed send: #destroy to: self.
]

{ #category : #accessing }
TkSystemWindowSDL2Window >> title [
	^ self rootMorph label
]
