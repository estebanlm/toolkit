private
buttonMorph: buttonModel
	| action |
	action := buttonModel glamourAction.
	^ PluggableButtonMorph new 
			width: action class tkButtonMorphWidth;
			hResizing: #rigid;
			icon: action icon;
			label: action title;
			model: buttonModel;
			action: #execute;
			beIconLeft;
			yourself	