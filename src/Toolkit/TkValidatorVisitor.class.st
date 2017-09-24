"
I'm a validator for magritte morphs. 
I refine my parent by checking special conditions: 

- forcePickOne means I can require an element but show an empty element in the list (this is for single options). Which means I need to modify the nil check.
"
Class {
	#name : #TkValidatorVisitor,
	#superclass : #MAValidatorVisitor,
	#category : 'Toolkit-Magritte-Model'
}

{ #category : #private }
TkValidatorVisitor >> validate: anObject using: aDescription [
	aDescription validateRequired: anObject.
	(anObject isNil and: [ aDescription isForcePickOne not ]) ifTrue: [ ^ self ].
	aDescription
		validateKind: anObject;
		validateSpecific: anObject;
		validateConditions: anObject
]
