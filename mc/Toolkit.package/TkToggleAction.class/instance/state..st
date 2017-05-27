accessing
state: aBoolean
	aBoolean 
		ifTrue: [ self pressButton ]
		ifFalse: [ self releaseButton ].
	