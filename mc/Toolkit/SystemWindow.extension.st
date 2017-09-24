Extension { #name : #SystemWindow }

{ #category : #'*Toolkit-Platform-showing' }
SystemWindow >> asTkSDL2Window [
	^ TkSystemWindowSDL2Window root: self
]

{ #category : #'*Toolkit-Glamour' }
SystemWindow >> disable [ 
	"Adds a 'disabling' morph on top"
	self isEnabled ifFalse: [ ^ self ].
	self releaseFocusIfContained.
	"self withAllSubmorphsDo: [ :each | each enabled: false ]."
	self addMorphFront: (Morph new
		color: (self theme backgroundColor alpha: 0.9);
		layoutFrame: LayoutFrame identity;
		hResizing: #spaceFill; 
		vResizing: #spaceFill;
		setProperty: #disabledArea toValue: true;
		yourself).
]

{ #category : #'*Toolkit-Glamour' }
SystemWindow >> enable [ 
	"Assumes that frst morph is a disabling morph and removes it"
	self isEnabled ifTrue: [ ^ self ].
	self submorphs first delete
	"self withAllSubmorphsDo: [ :each | each enabled: true ]"
]

{ #category : #'*Toolkit-Glamour' }
SystemWindow >> isEnabled [
	^ self submorphs isEmpty 
		or: [ ((self submorphs first valueOfProperty: #disabledArea) = true) not ]
]

{ #category : #'*Toolkit-Glamour' }
SystemWindow >> releaseFocusIfContained [
	"Release the focus if active morph is contained in window"
	| ownerMorphs activeMorph |
	
	activeMorph := self activeHand keyboardFocus. 
	ownerMorphs := OrderedCollection new.
	[ activeMorph isNil ] whileFalse: [ 
		ownerMorphs add: activeMorph.
		activeMorph := activeMorph owner ].
	(ownerMorphs includes: self) 
		ifTrue: [ self activeHand newKeyboardFocus: nil ]	
]

{ #category : #'*Toolkit-Platform-showing' }
SystemWindow >> tkOpen [
	^ TkPlatform current openWindow: self
]

{ #category : #'*Toolkit-Platform-showing' }
SystemWindow >> tkOpenModal [
	^ TkPlatform current openWindowModal: self
]

{ #category : #'*Toolkit-Platform-dispatch' }
SystemWindow >> tkOpenModalSDL2 [
	| window |
	
	window := self asTkSDL2Window.
	window center.
	window show.
	self waitUntilClosed.
	^ window
]

{ #category : #'*Toolkit-Platform-dispatch' }
SystemWindow >> tkOpenModalWorld [
	self 
		fullBounds;
		openInWorld;
		position: Display extent - self extent // 2.	
	Smalltalk ui theme runModal: self.
]

{ #category : #'*Toolkit-Platform-dispatch' }
SystemWindow >> tkOpenSDL2 [
	^ self asTkSDL2Window show
]

{ #category : #'*Toolkit-Platform-dispatch' }
SystemWindow >> tkOpenWorld [
	^ self openAsIs
]

{ #category : #'*Toolkit-Platform-showing' }
SystemWindow >> waitUntilClosed [
	[ self world notNil ]
		whileTrue: [ self outermostWorldMorph doOneCycle ].
	
]
