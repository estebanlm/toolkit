Extension { #name : #MAReferenceDescription }

{ #category : #'*Toolkit-Magritte' }
MAReferenceDescription >> tkAddHelpText [
	^ self propertyAt: #tkAddHelpText ifAbsent: [ self class tkDefaultAddHelpText ]
]

{ #category : #'*Toolkit-Magritte' }
MAReferenceDescription >> tkAddHelpText: aString [
	^ self propertyAt: #tkAddHelpText put: aString
]

{ #category : #'*Toolkit-Magritte' }
MAReferenceDescription >> tkAddIcon [
	^ self propertyAt: #tkAddIcon ifAbsent: [ self class tkDefaultAddIcon ]
]

{ #category : #'*Toolkit-Magritte' }
MAReferenceDescription >> tkAddIcon: anIcon [
	^ self propertyAt: #tkAddIcon put: anIcon
]

{ #category : #'*Toolkit-Magritte' }
MAReferenceDescription classSide >> tkDefaultAddHelpText [
	^ 'Add new'
]

{ #category : #'*Toolkit-Magritte' }
MAReferenceDescription classSide >> tkDefaultAddIcon [
	^ Smalltalk ui icons iconNamed: #add
]

{ #category : #'*Toolkit-Magritte' }
MAReferenceDescription classSide >> tkDefaultRemoveHelpText [
	^ 'Remove from list'
]

{ #category : #'*Toolkit-Magritte' }
MAReferenceDescription classSide >> tkDefaultRemoveIcon [
	^ Smalltalk ui icons iconNamed: #smallCancel
]

{ #category : #'*Toolkit-Magritte' }
MAReferenceDescription classSide >> tkDefaultRowsToShow [
	^ 10
]

{ #category : #'*Toolkit-Magritte' }
MAReferenceDescription >> tkRemoveHelpText [
	^ self propertyAt: #tkRemoveHelpText ifAbsent: [ self class tkDefaultRemoveHelpText ]
]

{ #category : #'*Toolkit-Magritte' }
MAReferenceDescription >> tkRemoveHelpText: aString [
	^ self propertyAt: #tkRemoveHelpText put: aString
]

{ #category : #'*Toolkit-Magritte' }
MAReferenceDescription >> tkRemoveIcon [
	^ self propertyAt: #tkRemoveIcon ifAbsent: [ self class tkDefaultRemoveIcon ]
]

{ #category : #'*Toolkit-Magritte' }
MAReferenceDescription >> tkRemoveIcon: anIcon [
	^ self propertyAt: #tkRemoveIcon put: anIcon
]

{ #category : #'*Toolkit-Magritte' }
MAReferenceDescription >> tkRowsToShow [
	^ self propertyAt: #tkRowsToShow ifAbsent: [ self class tkDefaultRowsToShow ]
]

{ #category : #'*Toolkit-Magritte' }
MAReferenceDescription >> tkRowsToShow: aNumber [
	self propertyAt: #tkRowsToShow put: aNumber
]

{ #category : #'*Toolkit-Magritte' }
MAReferenceDescription >> tkWhenCreated [
	^ self propertyAt: #tkWhenCreated ifAbsent: [ [ :value | ] ]
]

{ #category : #'*Toolkit-Magritte' }
MAReferenceDescription >> tkWhenCreated: aBlock [
	self propertyAt: #tkWhenCreated put: aBlock
]
