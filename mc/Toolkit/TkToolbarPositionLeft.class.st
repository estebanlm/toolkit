Class {
	#name : #TkToolbarPositionLeft,
	#superclass : #TkToolbarPosition,
	#category : 'Toolkit-Glamour-Morphic'
}

{ #category : #accessing }
TkToolbarPositionLeft class >> kind [
	^ #left
]

{ #category : #'configuring morphs' }
TkToolbarPositionLeft >> addToolbar: toolbarMorph size: anInteger [ to: aMorph
	| frame |
	frame := (0 @ 0 corner: 0 @ 1) asLayoutFrame rightOffset: anInteger + 8.
	aMorph addMorph: toolbarMorph fullFrame: frame.
	^ Margin left: anInteger + 8 top: 0 right: 0 bottom: 0
]

{ #category : #'configuring morphs' }
TkToolbarPositionLeft >> configureToolbar: dock [
	dock 
		listDirection: #topToBottom;
		hResizing: #spaceFill;
		vResizing: #shrinkWrap
]
