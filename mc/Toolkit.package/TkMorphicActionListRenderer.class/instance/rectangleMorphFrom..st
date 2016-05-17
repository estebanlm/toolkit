private
rectangleMorphFrom: anActionListPresentation
	^ anActionListPresentation isHorizontal 
		ifTrue: [ self rectangleMorphHorizontalFrom: anActionListPresentation ]
		ifFalse: [ self rectangleMorphVerticalFrom: anActionListPresentation ]
