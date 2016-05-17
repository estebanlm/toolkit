actions
add
	| object |
	
	object := (TkMagritteEditor 
		object: self magritteDescription tkReferenceClass new
		presenter: #create)
		go.
	object ifNil: [ ^ self ].
	self magritteDescription tkWhenCreated value: object.
	self magritteDescription options: (self magritteDescription options copyWith: object).
	listModel 
		items: self options;
		setSelectedItem: object.
	self value: object