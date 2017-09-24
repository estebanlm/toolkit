Extension { #name : #MAToManyRelationDescription }

{ #category : #'*Toolkit-Magritte' }
MAToManyRelationDescription classSide >> tkDefaultEditHelpText [
	^ 'Edit'
]

{ #category : #'*Toolkit-Magritte' }
MAToManyRelationDescription classSide >> tkDefaultEditIcon [
	^ Smalltalk ui icons iconNamed: #edit 
]

{ #category : #'*Toolkit-Magritte' }
MAToManyRelationDescription >> tkEditHelpText [
	^ self propertyAt: #tkEditHelpText ifAbsent: [ self class tkDefaultEditHelpText ]
]

{ #category : #'*Toolkit-Magritte' }
MAToManyRelationDescription >> tkEditHelpText: aString [
	^ self propertyAt: #tkEditHelpText put: aString
]

{ #category : #'*Toolkit-Magritte' }
MAToManyRelationDescription >> tkEditIcon [
	^ self propertyAt: #tkEditIcon ifAbsent: [ self class tkDefaultEditIcon ]
]

{ #category : #'*Toolkit-Magritte' }
MAToManyRelationDescription >> tkEditIcon: anIcon [
	^ self propertyAt: #tkEditIcon put: anIcon
]

{ #category : #'*Toolkit-Magritte' }
MAToManyRelationDescription >> tkWhenUpdated [
	^ self propertyAt: #tkWhenUpdated ifAbsent: [ [ :value | ] ]
]

{ #category : #'*Toolkit-Magritte' }
MAToManyRelationDescription >> tkWhenUpdated: aBlock [
	^ self propertyAt: #tkWhenUpdated put: aBlock
]
