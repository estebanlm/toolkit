private-building
buildEditButtonMorph: anObject
	| editIcon |
	editIcon := self magritteDescription tkEditIcon.
	^ IconicButton new 
		color: Color transparent;
		labelGraphic: editIcon;
		helpText: (self magritteDescription tkEditHelpText localised 
			format: {  self magritteDescription reference toString: anObject });
		target: self;
		actionSelector: #edit:;
		arguments: { anObject };
		borderWidth: 0;
		extent: editIcon extent;
		wrapCentering: #center;
		yourself