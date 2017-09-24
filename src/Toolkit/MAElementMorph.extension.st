Extension { #name : #MAElementMorph }

{ #category : #'*Toolkit-Magritte' }
MAElementMorph >> buildMorphReadonly [
	^ self stringMorph
		contents: self string;
		yourself
]
