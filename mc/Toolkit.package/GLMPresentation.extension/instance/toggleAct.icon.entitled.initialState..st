*Toolkit-Glamour-scripting
toggleAct: aBlock icon: anIcon entitled: aString initialState: aBoolean
	self 
		addAction: 
			((TkToggleAction new) 
				action: aBlock; 
				unpresedIcon: anIcon;
				title: aString;
				state: aBoolean;
				yourself)