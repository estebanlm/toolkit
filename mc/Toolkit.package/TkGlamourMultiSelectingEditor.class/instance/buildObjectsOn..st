building
buildObjectsOn: aPresenter
	aPresenter fastTable
		title: self listTitle;
		hideHeader;
		intercellSpacing: 1;
		column: '' evaluated: [ :object | self buildSelectCheckboxFor: object ] width: 16;
		column: '' evaluated: [ :object | self descriptionFor: object ].