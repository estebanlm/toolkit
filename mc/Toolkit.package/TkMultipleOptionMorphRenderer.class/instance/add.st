actions
add
	| object elements |
	
	object := (TkMagritteEditor 
		object: self magritteDescription tkReferenceClass new
		presenter: #create)
		go.
	object ifNil: [ ^ self ].
	self magritteDescription tkWhenCreated value: object.
	self magritteDescription options: (self magritteDescription options copyWith: object).
	elements := self value copyWith: object.
	self value: elements.
	listMorph 
		elements: elements asArray;
		refresh