*Toolkit-Glamour
toggleAct: aBlock onIcon: onIcon offIcon: offIcon entitled: aString
	"This is a toggle action (an on/off operation)"
	self 
		addAction: 
			((TkToggleAction new) 
				action: aBlock; 
				onIcon: onIcon;
				offIcon: onIcon;
				title: aString;
				turnOn;
				yourself)