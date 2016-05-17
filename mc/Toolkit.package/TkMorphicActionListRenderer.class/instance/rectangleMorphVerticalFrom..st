private
rectangleMorphVerticalFrom: anActionListPresentation
	^ (self rectangleMorphHorizontalFrom: anActionListPresentation)
		listDirection: #topToBottom;
		yourself
		