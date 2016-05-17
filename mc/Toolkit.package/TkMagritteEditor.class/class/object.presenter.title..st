instance creation
object: anObject presenter: aSymbol title: aString
	^ self 
		object: anObject 
		description: (anObject magritteDescriptionFor: aSymbol)
		title: aString