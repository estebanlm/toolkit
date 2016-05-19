actions
edit: anObject
	| object |
	
	object := (TkMagritteEditor object: anObject presenter: #update) go.
	object ifNil: [ ^ self ].
	self magritteDescription tkWhenUpdated value: object.
	listMorph refresh