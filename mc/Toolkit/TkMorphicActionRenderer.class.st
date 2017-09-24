Class {
	#name : #TkMorphicActionRenderer,
	#superclass : #GLMMorphicActionRenderer,
	#category : 'Toolkit-Glamour-Morphic'
}

{ #category : #rendering }
TkMorphicActionRenderer >> render: anAction [
	^ (super render: anAction)
		borderWidth: 0;
		in: [ :this | anAction icon ifNotNil: [ this extent: anAction icon extent ] ];
		yourself
]
