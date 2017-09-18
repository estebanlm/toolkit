*Toolkit-Glamour-scripting
toggleAct: aBlock icon: anIcon entitled: aString
	self 
		addAction: 
			((TkToggleAction new) 
				action: aBlock; 
				unpresedIcon: anIcon;
				title: aString;
				yourself)