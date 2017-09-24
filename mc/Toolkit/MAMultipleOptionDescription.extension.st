Extension { #name : #MAMultipleOptionDescription }

{ #category : #'*Toolkit-Magritte' }
MAMultipleOptionDescription classSide >> tkDefaultListingDescription [
	^ #listingDescription
]

{ #category : #'*Toolkit-Magritte' }
MAMultipleOptionDescription classSide >> tkDefaultPickAcceptIcon [
	^ Smalltalk ui icons iconNamed: #smallOk
]

{ #category : #'*Toolkit-Magritte' }
MAMultipleOptionDescription classSide >> tkDefaultPickCancelIcon [
	^ Smalltalk ui icons iconNamed: #smallCancel
]

{ #category : #'*Toolkit-Magritte' }
MAMultipleOptionDescription classSide >> tkDefaultPickHelpText [
	^ 'Pick one element'
]

{ #category : #'*Toolkit-Magritte' }
MAMultipleOptionDescription classSide >> tkDefaultPickIcon [
	^ Smalltalk ui icons iconNamed: #smallFind
]

{ #category : #'*Toolkit-Magritte' }
MAMultipleOptionDescription classSide >> tkDefaultPickListTitle [
	^ 'List of elements'
]

{ #category : #'*Toolkit-Magritte' }
MAMultipleOptionDescription classSide >> tkDefaultPickTitle [
	^ 'Pick One'
]

{ #category : #'*Toolkit-Magritte' }
MAMultipleOptionDescription classSide >> tkDefaultRemoveHelpText [
	^ 'Remove from list'
]

{ #category : #'*Toolkit-Magritte' }
MAMultipleOptionDescription classSide >> tkDefaultRemoveIcon [
	^ Smalltalk ui icons iconNamed: #smallCancel
]

{ #category : #'*Toolkit-Magritte' }
MAMultipleOptionDescription >> tkHeight [
	^ (self tkRowsToShow * 20) + 12
]

{ #category : #'*Toolkit-Magritte' }
MAMultipleOptionDescription >> tkListingDescription [
	^ self propertyAt: #tkListingDescription ifAbsent: [ self class tkDefaultListingDescription ] 
]

{ #category : #'*Toolkit-Magritte' }
MAMultipleOptionDescription >> tkListingDescription: aString [
	^ self propertyAt: #tkListingDescription put: aString
]

{ #category : #'*Toolkit-Magritte' }
MAMultipleOptionDescription >> tkPickAcceptIcon [
	^ self propertyAt: #tkPickAcceptIcon ifAbsent: [ self class tkDefaultPickAcceptIcon ]
]

{ #category : #'*Toolkit-Magritte' }
MAMultipleOptionDescription >> tkPickAcceptIcon: anIcon [
	self propertyAt: #tkPickAcceptIcon put: anIcon
]

{ #category : #'*Toolkit-Magritte' }
MAMultipleOptionDescription >> tkPickCancelIcon [
	^ self propertyAt: #tkPickCancelIcon ifAbsent: [ self class tkDefaultPickCancelIcon ]
]

{ #category : #'*Toolkit-Magritte' }
MAMultipleOptionDescription >> tkPickCancelIcon: anIcon [
	self propertyAt: #tkPickCancelIcon put: anIcon
]

{ #category : #'*Toolkit-Magritte' }
MAMultipleOptionDescription >> tkPickHelpText [
	^ self propertyAt: #tkPickHelpText ifAbsent: [ self class tkDefaultPickHelpText ]
]

{ #category : #'*Toolkit-Magritte' }
MAMultipleOptionDescription >> tkPickHelpText: aString [
	^ self propertyAt: #tkPickHelpText put: aString
]

{ #category : #'*Toolkit-Magritte' }
MAMultipleOptionDescription >> tkPickIcon [
	^ self propertyAt: #tkPickIcon ifAbsent: [ self class tkDefaultPickIcon ]
]

{ #category : #'*Toolkit-Magritte' }
MAMultipleOptionDescription >> tkPickIcon: anIcon [
	^ self propertyAt: #tkPickIcon put: anIcon
]

{ #category : #'*Toolkit-Magritte' }
MAMultipleOptionDescription >> tkPickListTitle [
	^ self propertyAt: #tkPickListTitle ifAbsent: [ self class tkDefaultPickListTitle ]
]

{ #category : #'*Toolkit-Magritte' }
MAMultipleOptionDescription >> tkPickListTitle: aString [
	^ self propertyAt: #tkPickListTitle put: aString
]

{ #category : #'*Toolkit-Magritte' }
MAMultipleOptionDescription >> tkPickTitle [
	^ self propertyAt: #tkPickTitle ifAbsent: [ self class tkDefaultPickTitle ]
]

{ #category : #'*Toolkit-Magritte' }
MAMultipleOptionDescription >> tkPickTitle: aString [
	^ self propertyAt: #tkPickTitle put: aString
]

{ #category : #'*Toolkit-Magritte' }
MAMultipleOptionDescription >> tkRemoveHelpText [
	^ self propertyAt: #tkRemoveHelpText ifAbsent: [ self class tkDefaultRemoveHelpText ]
]

{ #category : #'*Toolkit-Magritte' }
MAMultipleOptionDescription >> tkRemoveHelpText: aString [
	^ self propertyAt: #tkRemoveHelpText put: aString
]

{ #category : #'*Toolkit-Magritte' }
MAMultipleOptionDescription >> tkRemoveIcon [
	^ self propertyAt: #tkRemoveIcon ifAbsent: [ self class tkDefaultRemoveIcon ]
]

{ #category : #'*Toolkit-Magritte' }
MAMultipleOptionDescription >> tkRemoveIcon: anIcon [
	^ self propertyAt: #tkRemoveIcon put: anIcon
]
