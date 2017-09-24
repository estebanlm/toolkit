Class {
	#name : #TkToolbarPositionTop,
	#superclass : #TkToolbarPosition,
	#category : 'Toolkit-Glamour-Morphic'
}

{ #category : #accessing }
TkToolbarPositionTop class >> kind [
	^ #top
]

{ #category : #'configuring morphs' }
TkToolbarPositionTop >> addToolbar: toolbarMorph size: anInteger [ to: aMorph
	| frame |
	frame := (0@0 corner: 1@0) asLayoutFrame bottomOffset: anInteger.
	aMorph addMorph: toolbarMorph fullFrame: frame.
	^ Margin left: 0 top: anInteger right: 0 bottom: 0
]

{ #category : #'configuring morphs' }
TkToolbarPositionTop >> addToolbar: toolbarMorph [ to: aMorph
	| frame |
	frame := (0@0 corner: 1@0) asLayoutFrame bottomOffset: toolbarMorph height.
	aMorph addMorph: toolbarMorph fullFrame: frame.
	^ Margin left: 0 top: toolbarMorph height right: 0 bottom: 0
]

{ #category : #'configuring morphs' }
TkToolbarPositionTop >> configureToolbar: dockMorph [
	 "No need to do anything since regular dock morphs are already configured to be on top"
]
