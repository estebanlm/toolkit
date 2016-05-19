building
buildCurrentObjectOn: a
	a tkMagritte 
		title: [ :object | self titleFor: object ];
		presenter: #view;
		in: [ :this | self isReadOnly ifTrue: [ this beReadOnly ] ]