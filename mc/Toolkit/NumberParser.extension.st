Extension { #name : #NumberParser }

{ #category : #'*Toolkit-Magritte' }
NumberParser class >> isNumber: anObject [
	self parse: anObject onError: [ ^ false ].
	^ true
]
