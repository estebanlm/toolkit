private-building
buildRemoveButtonMorph: anObject
	| removeIcon |
	removeIcon := self magritteDescription tkRemoveIcon.
	^ IconicButton new 
		color: Color transparent;
		labelGraphic: removeIcon;
		helpText: (self magritteDescription tkRemoveHelpText localised 
			format: {  self magritteDescription reference toString: anObject });
		target: self;
		actionSelector: #remove:;
		arguments: { anObject };
		borderWidth: 0;
		extent: removeIcon extent;
		wrapCentering: #center;
		yourself