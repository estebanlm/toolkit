rendering
render: anAction
	^ (super render: anAction)
		borderWidth: 0;
		in: [ :this | anAction icon ifNotNil: [ this extent: anAction icon extent ] ];
		yourself