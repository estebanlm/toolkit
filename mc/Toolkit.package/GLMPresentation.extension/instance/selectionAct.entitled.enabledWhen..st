*Toolkit-Glamour-scripting
selectionAct: aBlock entitled: aString enabledWhen: conditionBlock
	self 
		addSelectionAction: 
			(TkAction new
				action: aBlock; 
				title: aString; 
				enabledCondition: conditionBlock;
				yourself)