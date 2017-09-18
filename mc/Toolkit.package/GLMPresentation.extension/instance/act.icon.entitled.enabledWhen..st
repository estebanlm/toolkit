*Toolkit-Glamour-scripting
act: aBlock icon: anIcon entitled: aString enabledWhen: conditionBlock
	self 
		addAction: 
			(TkAction new 
				action: aBlock; 
				icon: anIcon;
				title: aString; 
				enabledCondition: conditionBlock;
				yourself)