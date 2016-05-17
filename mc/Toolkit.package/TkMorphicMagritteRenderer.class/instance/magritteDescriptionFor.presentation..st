rendering
magritteDescriptionFor: anObject presentation: aMagrittePresentation
	| description |
	
	description := aMagrittePresentation presenter
		ifNotNil: [ :aPresenter | (anObject magritteDescriptionFor: aPresenter) copy ]
		ifNil: [ (aMagrittePresentation magritteDescription glamourValue: anObject) copy ].
	
	"Using MAContainerMorph can raise some problems, as it try to delete morphs after commiting. We don't want this behavior."
	(description morphClass = MAContainerMorph)
		ifTrue: [description morphClass: MASilentContainerMorph]. 
	
	aMagrittePresentation isReadOnly ifTrue: [ 
		description readonly: true.
		description children do: [ :each | each readonly: true ] ].
	
	^ description