private factory
createPickButtonMorph
	^ PluggableButtonMorph new 
		icon: self magritteDescription tkPickIcon;
		label: nil;
		helpText: self magritteDescription tkPickHelpText;
		model: self;
		action: #chooseOne;
		borderWidth: 0;
		yourself