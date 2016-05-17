generating
go 
	| result |
	
	result := self asMagritteMorph 
		tkAddButtons;
		addWindowWithTitle: self title extent: self preferredExtent;
		tkOpenModal.
	^ result ifNotNil: [ self createObject ] 
			