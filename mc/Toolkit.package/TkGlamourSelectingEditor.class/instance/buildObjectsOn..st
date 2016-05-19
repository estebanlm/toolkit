building
buildObjectsOn: aPresenter
	aPresenter fastList
		title: self listTitle;
		in: [ :this | self addObjectsMenuOn: this ];
		format: [ :object | self descriptionFor: object ].