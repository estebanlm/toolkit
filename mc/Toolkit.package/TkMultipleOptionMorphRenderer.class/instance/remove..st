actions
remove: anObject
	| elements |
	elements := self value copyWithout: anObject.
	self value: elements.
	listMorph 
		elements: elements asArray;
		refresh