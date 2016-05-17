private
validate: anObject using: aDescription
	aDescription validateRequired: anObject.
	(anObject isNil and: [ aDescription isForcePickOne not ]) ifTrue: [ ^ self ].
	aDescription
		validateKind: anObject;
		validateSpecific: anObject;
		validateConditions: anObject