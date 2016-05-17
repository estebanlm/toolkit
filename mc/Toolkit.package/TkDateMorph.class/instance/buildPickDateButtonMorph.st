private-building
buildPickDateButtonMorph
	^ PluggableButtonMorph new 
		icon: self magritteDescription tkPickIcon;
		label: nil;
		helpText: self magritteDescription tkPickHelpText;
		model: self;
		action: #pickDate;
		borderWidth: 0;
		yourself