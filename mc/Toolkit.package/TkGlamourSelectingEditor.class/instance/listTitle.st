accessing
listTitle
	^ listTitle ifNil: [ listTitle := self class defaultListTitle ]