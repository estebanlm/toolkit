building
buildObjectsOn: aPresenter
	aPresenter fastList
		title: self listTitle;
		in: [ :this | self addObjectsMenuOn: this ];
		display: [ self list ];
		format: [ :object | self descriptionFor: object ].