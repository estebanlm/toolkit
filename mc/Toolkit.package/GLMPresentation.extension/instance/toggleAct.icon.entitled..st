*Toolkit-Glamour
toggleAct: aBlock icon: anIcon entitled: aString
	self 
		addAction: 
			((TkToggleAction new) 
				action: aBlock; 
				onIcon: anIcon;
				title: aString;
				yourself)