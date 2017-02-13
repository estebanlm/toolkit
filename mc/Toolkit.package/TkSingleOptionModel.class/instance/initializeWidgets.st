initialization
initializeWidgets
	list := self newDropList.
	addButton := self newButton.
	
	addButton 
		icon: self magritteDescription tkAddIcon;
		"helpText: self magritteDescription tkAddHelpText;"
		action: [ self model add ].