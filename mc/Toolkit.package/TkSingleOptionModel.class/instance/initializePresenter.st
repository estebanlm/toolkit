initialization
initializePresenter
	self list 
		items: self model options;
		displayBlock: [ :item | self displayStringOf: item ];
		setSelectedItem: self model value;
		whenSelectedItemChanged: [ :item | self model value: item ].