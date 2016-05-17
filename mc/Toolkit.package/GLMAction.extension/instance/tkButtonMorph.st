*Toolkit-Glamour
tkButtonMorph
	^ PluggableButtonMorph new 
		width: self class tkButtonMorphWidth;
		hResizing: #rigid;
		icon: self icon;
		label: self title;
		actionBlock: self action;
		beIconLeft;
		yourself