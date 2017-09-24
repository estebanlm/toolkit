Class {
	#name : #TkSingleOptionMorphRenderer,
	#superclass : #TkMorphRenderer,
	#category : 'Toolkit-Magritte-Renderer'
}

{ #category : #rendering }
TkSingleOptionMorphRenderer >> renderEditor [
	| dropDownMorph |
	
	dropDownMorph := (TkSingleOptionModel 
		model: self model description: self magritteDescription)
		buildWithSpec.
	morph addMorphBack: (dropDownMorph
		height: self class rowHeight;
		yourself)
]
