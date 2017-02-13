rendering
renderEditor
	| dropDownMorph |
	
	dropDownMorph := (TkSingleOptionModel 
		model: self model description: self magritteDescription)
		buildWithSpec.
	morph addMorphBack: (dropDownMorph
		height: self class rowHeight;
		yourself)