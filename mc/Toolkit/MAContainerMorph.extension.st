Extension { #name : #MAContainerMorph }

{ #category : #'*Toolkit-Magritte-decorating' }
MAContainerMorph >> addWindowWithTitle: aString extent: aSize [
	self addWindow.
	morph 
		setLabel: aString;
		extent: aSize.
]

{ #category : #'*Toolkit-Magritte-decorating' }
MAContainerMorph >> tkAddAcceptButton [
	^ self tkAddButtons: { 
		GLMGenericAction new 
			action: [ self save ];
			title: self magritteDescription tkAcceptLabel;
			icon: self magritteDescription tkAcceptIcon;
			yourself }
]

{ #category : #'*Toolkit-Magritte-decorating' }
MAContainerMorph >> tkAddButtons [
	^ self tkAddButtons: { 
		GLMGenericAction new 
			action: [ self cancel ];
			title: self magritteDescription tkCancelLabel;
			icon: self magritteDescription tkCancelIcon;
			yourself.
		GLMGenericAction new 
			action: [ self save ];
			title: self magritteDescription tkAcceptLabel;
			icon: self magritteDescription tkAcceptIcon;
			yourself }
]

{ #category : #'*Toolkit-Magritte-decorating' }
MAContainerMorph >> tkAddButtons: anArray [
	morph := self rectangleMorph
		addMorphBack: self morph;
		addMorphBack: (self tkBarMorph: anArray);
		yourself	
]

{ #category : #'*Toolkit-Magritte-decorating' }
MAContainerMorph >> tkBarMorph: anArray [
	| bar |
	bar := self rectangleMorph
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		listDirection: #leftToRight;
		listCentering: #bottomRight;
		wrapCentering: #bottomRight;
		cellInset: self defaultSpacerSize;
		yourself.
	anArray do: [ :anAction |
		bar addMorphBack: anAction tkButtonMorph ].
	^ bar
]

{ #category : #'*Toolkit-Magritte-showing' }
MAContainerMorph >> tkOpen [
	"Technically, this is not a morph, but it will work as one :)"
	^ TkPlatform current openMorph: self
]

{ #category : #'*Toolkit-Magritte-showing' }
MAContainerMorph >> tkOpenModal [
	"Technically, this is not a window, but it will work as one :)"
	^ TkPlatform current openWindowModal: self
]

{ #category : #'*Toolkit-Magritte-dispatch' }
MAContainerMorph >> tkOpenModalSDL2 [
	| result window  |

	result := nil.
	window := self morph
		fullBounds;
		asTkSDL2Window.
	window center.
	window show.
	self onAnswer: [ :value | result := value. window close ]. 
	self waitUntilClosed.
	^ result	
]

{ #category : #'*Toolkit-Magritte-dispatch' }
MAContainerMorph >> tkOpenModalWorld [
	| result |
	result := nil.
	self onAnswer: [ :value | result := value ].
	self morph
		fullBounds;
		position: Display extent - self morph extent // 2.
	self morph openAsIs.
	self waitUntilClosed.
	^ result
]

{ #category : #'*Toolkit-Magritte-dispatch' }
MAContainerMorph >> tkOpenSDL2 [
	^ self morph openInOSWindow 
		when: WindowClosed send: #cancel to: self;
		yourself
]

{ #category : #'*Toolkit-Magritte-dispatch' }
MAContainerMorph >> tkOpenWorld [
	^ self openInWorld
]
