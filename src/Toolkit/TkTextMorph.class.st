Class {
	#name : #TkTextMorph,
	#superclass : #MATextMorph,
	#category : 'Toolkit-Magritte-Morphic'
}

{ #category : #private }
TkTextMorph >> buildMorphView [
	self magritteDescription isReadonly 
		ifTrue: [ ^ self buildMorphReadonly ].
	^ super buildMorphView
]
