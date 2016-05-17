accessing
state: aBoolean
	aBoolean 
		ifTrue: [ self owner select: self object ]
		ifFalse: [ self owner removeSelection: self object  ]
