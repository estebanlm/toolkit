Extension { #name : #MADateDescription }

{ #category : #'*Toolkit-Magritte' }
MADateDescription classSide >> tkDefaultPickHelpText [
	^ 'Pick one date'
]

{ #category : #'*Toolkit-Magritte' }
MADateDescription classSide >> tkDefaultPickIcon [
	^ Smalltalk ui icons iconNamed: #calendar
]

{ #category : #'*Toolkit-Magritte' }
MADateDescription >> tkPickHelpText [
	^ self propertyAt: #tkPickHelpText ifAbsent: [ self class tkDefaultPickHelpText ]
]

{ #category : #'*Toolkit-Magritte' }
MADateDescription >> tkPickHelpText: aString [
	^ self propertyAt: #tkPickHelpText put: aString
]

{ #category : #'*Toolkit-Magritte' }
MADateDescription >> tkPickIcon [
	^ self propertyAt: #tkPickIcon ifAbsent: [ self class tkDefaultPickIcon ]
]

{ #category : #'*Toolkit-Magritte' }
MADateDescription >> tkPickIcon: anIcon [
	^ self propertyAt: #tkPickIcon put: anIcon
]
