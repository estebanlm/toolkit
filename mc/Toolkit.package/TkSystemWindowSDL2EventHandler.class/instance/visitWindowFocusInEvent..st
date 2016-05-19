visiting
visitWindowFocusInEvent: anEvent
	window menuList 
		do: [ :each | each close ];
		removeAll