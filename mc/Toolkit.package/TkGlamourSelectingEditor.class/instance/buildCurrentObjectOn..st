building
buildCurrentObjectOn: a
	a tkMagritte 
		title: [ :object | self titleFor: object ];
		presenter: #view;
		beReadOnly