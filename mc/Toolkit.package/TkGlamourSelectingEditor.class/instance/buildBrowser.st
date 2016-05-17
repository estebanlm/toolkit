building
buildBrowser
	| browser |
	
	browser := GLMTabulator new 
		title: [ self title ];
		initialExtent: self preferredExtent;
		row: [ :row |
			row 
				column: #objects;
				column: #currentObject ];
		row: #actions size: 35;
		yourself.
		
	browser transmit 
		to: #objects;
		andShow: [ :a | self buildObjectsOn: a ].
		
	browser transmit
		from: #objects;
		to: #currentObject;
		andShow: [ :a | self buildCurrentObjectOn: a ].
	
	self buildActionsOn: browser.
	
	^ browser