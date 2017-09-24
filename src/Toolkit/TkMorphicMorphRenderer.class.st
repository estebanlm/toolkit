"
I render a morph presentation as defined in TkMagrittePresentation.
"
Class {
	#name : #TkMorphicMorphRenderer,
	#superclass : #GLMMorphicMorphRenderer,
	#category : 'Toolkit-Glamour-Morphic'
}

{ #category : #rendering }
TkMorphicMorphRenderer >> morphFrom: aMorphPresentation [
	| morph |
	
	morph := super morphFrom: aMorphPresentation.
	aMorphPresentation morphTransmissions 
		cull: aMorphPresentation 
		cull: morph. 
	^ morph 
]
