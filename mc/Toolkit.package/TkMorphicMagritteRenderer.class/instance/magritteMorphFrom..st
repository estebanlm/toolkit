rendering
magritteMorphFrom: aMagrittePresentation
	| toShow description magritteDescriptionMorph |
	toShow := aMagrittePresentation displayValue.
	description := self magritteDescriptionFor: toShow presentation: aMagrittePresentation.
		
	magritteDescriptionMorph :=  (description asMorphOn: toShow)
		onAnswer: [ :value | aMagrittePresentation reactOnAnswerFor: value ].
	aMagrittePresentation isReadOnly 
		ifFalse: [ magritteDescriptionMorph tkAddButtons ].
	
	^ magritteDescriptionMorph morph
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		layoutChanged;
		yourself.