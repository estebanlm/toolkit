Class {
	#name : #TkMorphSDL2EventHandler,
	#superclass : #OSWindowEventVisitor,
	#instVars : [
		'rootMorph',
		'activeHand'
	],
	#classVars : [
		'SymbolCharacterMapping'
	],
	#pools : [
		'OSKeySymbols'
	],
	#category : 'Toolkit-SDL2'
}

{ #category : #'instance creation' }
TkMorphSDL2EventHandler class >> for: aMorph [
	^ self basicNew 
		initializeRootMorph: aMorph; 
		yourself
]

{ #category : #'class initialization' }
TkMorphSDL2EventHandler class >> initialize [
	"
	self initialize
	"
	super initialize.
	SymbolCharacterMapping := Dictionary new.
	{
	 OSK_RETURN . Character cr.
	 OSK_BACKSPACE . Character backspace.
	 OSK_TAB . Character tab.
	 OSK_HOME . Character home.
	 OSK_LEFT . Character arrowLeft.
	 OSK_UP . Character arrowUp.
	 OSK_RIGHT . Character arrowRight.
	 OSK_DOWN . Character arrowDown.
	 OSK_END . Character end.
	 OSK_INSERT . Character insert.
	 OSK_PAGEUP . Character pageUp.
	 OSK_PAGEDOWN . Character pageDown.
	 OSK_DELETE. Character delete.
	
	 OSK_KP_0 . $0.
	 OSK_KP_1 . $1.
	 OSK_KP_2 . $2.
	 OSK_KP_3 . $3.
	 OSK_KP_4 . $4.
	 OSK_KP_5 . $5.
	 OSK_KP_6 . $6.
	 OSK_KP_7 . $7.
	 OSK_KP_8 . $8.
	 OSK_KP_9 . $9.
	 OSK_KP_DIVIDE . $/.
	 OSK_KP_MULTIPLY . $*.
	 OSK_KP_PLUS . $+.
	 OSK_KP_MINUS . $-.
	 OSK_KP_ENTER . Character cr.
	 OSK_KP_PERIOD . $..
	} pairsDo: [ :key :val | SymbolCharacterMapping at: key put: val charCode ]
]

{ #category : #'instance creation' }
TkMorphSDL2EventHandler class >> new [
	self error: 'Use #for:'
]

{ #category : #private }
TkMorphSDL2EventHandler >> activeHand [ 
	^ activeHand ifNil: [
		activeHand := HandMorph new
			privateOwner: rootMorph;
			yourself ]
]

{ #category : #private }
TkMorphSDL2EventHandler >> convertButton: osButton [
	osButton = 1 ifTrue: [ ^ MouseButtonEvent redButton ].
	osButton = 2 ifTrue: [ ^ MouseButtonEvent blueButton ].
	osButton = 3 ifTrue: [ ^ MouseButtonEvent yellowButton ].
]

{ #category : #private }
TkMorphSDL2EventHandler >> convertModifiers: modifiers [
	| buttons |
	buttons := 0.
	
	"Alt/Option key"
	modifiers alt ifTrue: [
		"On windows and unix, treat alt key as command key"
		buttons := Smalltalk os isWin32 | Smalltalk os isUnix
			ifTrue: [ buttons | 2r01000000 ]
			ifFalse: [ buttons | 2r00100000 ]
	]. 
	
	modifiers ctrl ifTrue: [ buttons := buttons | 2r00010000 ]. "Control key"
	modifiers shift ifTrue: [ buttons := buttons | 8 ]. "Shift key"
	modifiers cmd ifTrue: [ buttons := buttons | 2r01000000 ]. "Cmd key"
	
	modifiers buttons button1 ifTrue:  [ buttons := buttons | MouseButtonEvent redButton ].
	modifiers buttons button2 ifTrue:  [ buttons := buttons | MouseButtonEvent blueButton ].
	modifiers buttons button3 ifTrue:  [ buttons := buttons | MouseButtonEvent yellowButton ].
	^ buttons
]

{ #category : #events }
TkMorphSDL2EventHandler >> dispatchMorphicEvent: anEvent [
	"Dispatch the event in the UI thread, to emulate world function"
	self flag: #todo. "Not sure this should be fine... maybe this is my oportunity to separate the 
	UI thread, and the application thread... but we'll see."
	WorldState defer: [ self activeHand handleEvent: anEvent ]. 

]

{ #category : #events }
TkMorphSDL2EventHandler >> handleEvent: anEvent [
	
	"convert the event to morphic one, and dispatch it whatever..."
	| morphicEvent |
	
	morphicEvent := anEvent accept: self.
	morphicEvent isMorphicEvent ifFalse: [ ^ self ].
	
	self dispatchMorphicEvent: morphicEvent
	
]

{ #category : #initialization }
TkMorphSDL2EventHandler >> initializeRootMorph: aMorph [
	rootMorph := aMorph.
	self initialize
]

{ #category : #visiting }
TkMorphSDL2EventHandler >> mapSymbolToKeyValue: symbol [
	^ SymbolCharacterMapping at: symbol ifAbsent: [
		 "Don't allow symbol values outside the unicode range"
		 symbol >= 16r400000 ifTrue: [ 0 ] ifFalse: [ symbol ] ]
]

{ #category : #accessing }
TkMorphSDL2EventHandler >> rootMorph [
	^ rootMorph
]

{ #category : #visiting }
TkMorphSDL2EventHandler >> visitKeyDownEvent: anEvent [
	| keyEvent keyEvent2 mods |

	mods := anEvent modifiers.
	keyEvent := KeyboardEvent new
		setType: #keyDown
		buttons: (self convertModifiers: mods)
		position: anEvent position
		keyValue: (self mapSymbolToKeyValue: anEvent symbol)
		charCode: (self mapSymbolToKeyValue: anEvent symbol)
		hand:  self activeHand
		stamp: Time millisecondClockValue.
	keyEvent scanCode: anEvent scanCode.
	
	"This is for ctrl/alt held alone makes morphic think that null character is good text input"
	keyEvent keyValue = 0 ifTrue: [ ^ self ]. 
	
	
	"That's stupid and horrible, but that's the way we doing it for now"
	keyEvent keyValue = 27 "Esc" ifFalse: [
		anEvent character ifNil: [ 
			(mods alt or: [ mods ctrl or: [ mods cmd ] ]) ifFalse: [ 
				^ nil
			]]
	].
		
	"Workaround for SDL<->Morphic: produce keystroke events
	if any modifier key held down (for non-modified keys there are OSTextInputEvent)"
	
	keyEvent2 := KeyboardEvent new
		setType: #keystroke
		buttons: (self convertModifiers: anEvent modifiers)
		position: anEvent position
		keyValue: (self mapSymbolToKeyValue: anEvent symbol)
		charCode: (self mapSymbolToKeyValue: anEvent symbol)
		hand:  rootMorph activeHand
		stamp: Time millisecondClockValue.
	keyEvent2 scanCode: anEvent scanCode.

	^ keyEvent2
]

{ #category : #visiting }
TkMorphSDL2EventHandler >> visitKeyUpEvent: anEvent [
	| keyEvent |
	keyEvent := KeyboardEvent new
		setType: #keyUp
		buttons: (self convertModifiers: anEvent modifiers)
		position: anEvent position
		keyValue: (self mapSymbolToKeyValue: anEvent symbol)
		charCode: (self mapSymbolToKeyValue: anEvent symbol)
		hand:  self activeHand
		stamp: Time millisecondClockValue.
	keyEvent scanCode: anEvent scanCode.
	^ keyEvent
]

{ #category : #visiting }
TkMorphSDL2EventHandler >> visitMouseButtonPressEvent: anEvent [
	anEvent isWheel ifTrue: [ 
		^ MouseWheelEvent new 
			setType: #mouseWheel
			position: anEvent position
			direction: anEvent wheelDirection
			buttons: (self convertModifiers: anEvent modifiers)
			hand: self activeHand
			stamp: Time millisecondClockValue ].
			
	^ MouseButtonEvent new
		setType: #mouseDown 
		position: anEvent position 
		which: (self convertButton: anEvent button)
		buttons: (self convertModifiers: anEvent modifiers) | (self convertButton: anEvent button)
		hand: self activeHand
		stamp: Time millisecondClockValue
]

{ #category : #visiting }
TkMorphSDL2EventHandler >> visitMouseButtonReleaseEvent: anEvent [
	anEvent isWheel ifTrue: [ ^ nil ].

	^ MouseButtonEvent new
		setType: #mouseUp
		position: anEvent position 
		which: (self convertButton: anEvent button)
		buttons: (self convertModifiers: anEvent modifiers)
		hand: self activeHand
		stamp: Time millisecondClockValue
]

{ #category : #visiting }
TkMorphSDL2EventHandler >> visitMouseMoveEvent: anEvent [
	| oldPos |
	oldPos := rootMorph activeHand position.

	^ MouseMoveEvent basicNew
		setType: #mouseMove 
		startPoint: oldPos
		endPoint: anEvent position 
		trail: { oldPos. anEvent position }
		buttons: (self convertModifiers: anEvent modifiers)
		hand: self activeHand
		stamp: Time millisecondClockValue
]

{ #category : #visiting }
TkMorphSDL2EventHandler >> visitMouseWheelEvent: anEvent [
	| vertical |
	vertical := anEvent scrollVertical.
	vertical = 0 ifTrue: [ ^ nil ].
	
	^ MouseWheelEvent new 
		setType: #mouseWheel
		position: anEvent position
		direction: (vertical > 0 ifTrue: [Character arrowUp] ifFalse: [Character arrowDown])
		buttons: (self convertModifiers: anEvent modifiers)
		hand: self activeHand
		stamp: Time millisecondClockValue
]

{ #category : #visiting }
TkMorphSDL2EventHandler >> visitTextInputEvent: anEvent [
	| keyEvent char mods |
	anEvent text ifNil: [ ^ nil ].
	char := anEvent text first.
	char ifNil: [ ^ nil ].
	mods := anEvent modifiers.
	"If a modifier key is pressed the keystroke event is handled by #visitMouseDownEvent:"
	(mods alt or: [ mods ctrl or: [ mods cmd ] ])
		ifTrue: [ ^ nil ].
		
	keyEvent := KeyboardEvent new
		setType: #keystroke
		buttons: (self convertModifiers: anEvent modifiers)
		position: anEvent position
		keyValue: char charCode
		charCode: char charCode
		hand: self activeHand
		stamp: Time millisecondClockValue.
	
	^ keyEvent
]

{ #category : #visiting }
TkMorphSDL2EventHandler >> visitUnknownEvent: anEvent [
	Transcript
		show: 'Unknown event: ';
		show: anEvent data printString;
		cr
]

{ #category : #visiting }
TkMorphSDL2EventHandler >> visitWindowCloseEvent: anEvent [
	anEvent suppressDefaultAction.
	self window close
]

{ #category : #visiting }
TkMorphSDL2EventHandler >> visitWindowResizeEvent: anEvent [

	"window resized"
	rootMorph checkNewWindowSize.
]
