actions
add
	| object elements clazz |
	
	clazz := self classToAdd.
	clazz ifNil: [ ^ self ].	
	object := (TkMagritteEditor object: clazz new presenter: #create) go.
	object ifNil: [ ^ self ].
	self magritteDescription tkWhenCreated value: object.
	elements := self value copyWith: object.
	self value: elements.
	listMorph 
		elements: elements asArray;
		refresh