Class {
	#name : #TkSystemWindowRenderer,
	#superclass : #GLMMorphicWindowRenderer,
	#category : 'Toolkit-Glamour-Morphic'
}

{ #category : #'instance creation' }
TkSystemWindowRenderer class >> refresh: aPresentation window: aWindow from: aRenderer [ 
	^ self new 
		renderer: aRenderer;
		window: aWindow;
		refresh: aPresentation
]

{ #category : #rendering }
TkSystemWindowRenderer >> basicRender: aRenderable [
	| contentMorph topOffset bottomOffset toolbarOffsets |

	topOffset := 4.
	bottomOffset := self handlePotentialStatusbarFor: aRenderable.

	self setLabelOf: window for: aRenderable.
	toolbarOffsets := aRenderable hasToolbar 
		ifTrue: [ self renderToolbarFor: aRenderable in: window ]
		ifFalse: [ 0@0 corner: 0@0 ].

	contentMorph := self renderObject: aRenderable. 
	window 
		addContentMorph: contentMorph 
		fullFrame:  ((0@0 corner: 1@1) asLayoutFrame 
			leftOffset: toolbarOffsets left;
			topOffset: topOffset + toolbarOffsets top;
			rightOffset: toolbarOffsets right;
			bottomOffset: bottomOffset + toolbarOffsets bottom;
			yourself).
	
	self setPotentialBackgroundColorFor: aRenderable.
	aRenderable when: GLMPresentationUpdated send: #actOnPresentationUpdated: to: self.
	aRenderable watcherPane notNil
		ifTrue: [ GLMMorphicWatcherRenderer render: aRenderable watcherPane from: self renderer ].
	
	^ window
]

{ #category : #private }
TkSystemWindowRenderer >> collectActionsFor: aPresentation [
	^ aPresentation allActions
]

{ #category : #rendering }
TkSystemWindowRenderer >> newSystemWindow: aRenderable [
	| newWindow |
	newWindow := TkSystemWindow new model: aRenderable.
	newWindow 
		on: #keyStroke 
		send: #handleKeyStroke: 
		to: newWindow.
	^ newWindow
]

{ #category : #rendering }
TkSystemWindowRenderer >> refresh: aRenderable [
	self removePresentationMorphs.	
	^ self basicRender: aRenderable
]

{ #category : #private }
TkSystemWindowRenderer >> removePresentationMorphs [
	window ifNil: [ ^ self ].
	window toolbarMorph ifNotNil: [ :morph | window removeMorph: morph ].
	window removeMorph: window contentMorph
]

{ #category : #rendering }
TkSystemWindowRenderer >> render: aRenderable [
	window := self newSystemWindow: aRenderable.
	
	self installActionsOnModel: window fromPresentation: aRenderable .
	self installKeystrokeActionsOnMorph: window fromPresentation: aRenderable.
	
	self basicRender: aRenderable.
	
	^ window
]

{ #category : #rendering }
TkSystemWindowRenderer >> renderToolbarFor: aRenderable in: aWindow [
	| toolbarMorph |
	toolbarMorph := self renderToolbarForPresentation: aRenderable inMorph: aWindow.
	window toolbarMorph: toolbarMorph.
	^ aRenderable toolbarPosition 
		addToolbar: toolbarMorph
		size: self toolbarSize 
		to: aWindow
]

{ #category : #rendering }
TkSystemWindowRenderer >> renderToolbarForPresentation: aPresentation inMorph: aMorph [
	| dock buttons |
	
	dock := aMorph theme newToolDockingBarIn: aMorph.
	aPresentation toolbarPosition configureToolbar: dock.
	buttons := self toolbarButtonsForPresentation: aPresentation.
	dock addAllMorphs: buttons.
	(aPresentation allActions select: #isMenu) 
		ifNotEmpty: [ 
			dock addMorphBack: (Morph new 
				color: Color transparent;
				hResizing: #spaceFill;
				vResizing: #spaceFill;
				yourself).
			dock addMorphBack: ((self 
				dropDownMenuFrom: [ | menu |
					menu := self menuIn: MenuMorph new for: aPresentation.
					menu popUpEvent: self currentEvent in: aMorph world ]
				withIcon: #glamorousMore asIcon)
				yourself)].
	
	^ dock
]

{ #category : #rendering }
TkSystemWindowRenderer >> toolbarButtonsForPresentation: aPresentation [
	^ (self collectActionsFor: aPresentation)
		select: [:each | each isButton and: [ each isAvailableOn: aPresentation ]]
		thenCollect: [:each | |actionMorph|
			actionMorph := ((each renderGlamorouslyOn: self renderer)
				enabled: (each isEnabledOn: aPresentation);
				yourself).
			actionMorph arguments 
				ifNil: [ actionMorph arguments: { aPresentation } ]
				ifNotNil: [ actionMorph arguments: ({ aPresentation }, actionMorph arguments) ].
			actionMorph ].
	
]

{ #category : #private }
TkSystemWindowRenderer >> toolbarSize [
	^ 20
]

{ #category : #private }
TkSystemWindowRenderer >> window: aWindow [
	window := aWindow
]
