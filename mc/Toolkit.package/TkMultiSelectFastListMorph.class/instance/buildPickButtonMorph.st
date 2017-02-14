private-building
buildPickButtonMorph
	^ PluggableButtonMorph new 
		icon: self magritteDescription tkPickIcon;
		label: nil;
		helpText: self magritteDescription tkPickHelpText;
		model: self;
		action: #pickOne;
		borderWidth: 0;
		yourself