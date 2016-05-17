private-building
buildAddButtonMorph
	^ PluggableButtonMorph new 
		icon: self magritteDescription tkAddIcon;
		label: nil;
		helpText: self magritteDescription tkAddHelpText;
		model: self;
		action: #add;
		borderWidth: 0;
		yourself