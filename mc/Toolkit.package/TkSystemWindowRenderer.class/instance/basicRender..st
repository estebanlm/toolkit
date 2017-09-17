rendering
basicRender: aRenderable
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