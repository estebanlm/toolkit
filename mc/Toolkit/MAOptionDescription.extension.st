Extension { #name : #MAOptionDescription }

{ #category : #'*Toolkit-Magritte' }
MAOptionDescription >> beForcePickOne [
	self beForcePickOne: 'You need to pick one.'
]

{ #category : #'*Toolkit-Magritte' }
MAOptionDescription >> beForcePickOne: aString [
	self propertyAt: #forcePickOne put: true.
	self extensible: true.
	self addCondition: [ :value | value notNil ] labelled: aString
]

{ #category : #'*Toolkit-Magritte' }
MAOptionDescription >> isForcePickOne [
	^ self propertyAt: #forcePickOne ifAbsent: [ false ]. 

]

{ #category : #'*Toolkit-Magritte' }
MAOptionDescription >> tkAddHelpText [
	^ self propertyAt: #tkAddHelpText ifAbsent: [ self class tkDefaultAddHelpText ]
]

{ #category : #'*Toolkit-Magritte' }
MAOptionDescription >> tkAddHelpText: aString [
	^ self propertyAt: #tkAddHelpText put: aString
]

{ #category : #'*Toolkit-Magritte' }
MAOptionDescription >> tkAddIcon [
	^ self propertyAt: #tkAddIcon ifAbsent: [ self class tkDefaultAddIcon ]
]

{ #category : #'*Toolkit-Magritte' }
MAOptionDescription >> tkAddIcon: anIcon [
	^ self propertyAt: #tkAddIcon put: anIcon
]

{ #category : #'*Toolkit-Magritte' }
MAOptionDescription classSide >> tkDefaultAddHelpText [
	^ 'Add new'
]

{ #category : #'*Toolkit-Magritte' }
MAOptionDescription classSide >> tkDefaultAddIcon [
	^ Smalltalk ui icons iconNamed: #add
]

{ #category : #'*Toolkit-Magritte' }
MAOptionDescription classSide >> tkDefaultRowsToShow [
	^ 10
]

{ #category : #'*Toolkit-Magritte' }
MAOptionDescription >> tkReferenceClass [
	^ self propertyAt: #tkReferenceClass ifAbsent: [ nil ]
]

{ #category : #'*Toolkit-Magritte' }
MAOptionDescription >> tkReferenceClass: aClass [
	self propertyAt: #tkReferenceClass put: aClass
]

{ #category : #'*Toolkit-Magritte' }
MAOptionDescription >> tkRowsToShow [
	^ self propertyAt: #tkRowsToShow ifAbsent: [ self class tkDefaultRowsToShow ]
]

{ #category : #'*Toolkit-Magritte' }
MAOptionDescription >> tkRowsToShow: aNumber [
	self propertyAt: #tkRowsToShow put: aNumber
]

{ #category : #'*Toolkit-Magritte' }
MAOptionDescription >> tkWhenCreated [
	^ self propertyAt: #tkWhenCreated ifAbsent: [ [ :value | ] ]
]

{ #category : #'*Toolkit-Magritte' }
MAOptionDescription >> tkWhenCreated: aBlock [
	self propertyAt: #tkWhenCreated put: aBlock
]
