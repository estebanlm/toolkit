building
buildActionsOn: aBrowser
	aBrowser transmit
		to: #actions;
		andShow: [ :a | 
			a tkActionList
				act: [ window close ] 
					icon: self cancelIcon
					entitled: 'Cancel';
				act: [ :presenter | value := selection. window close ] 
					icon: self acceptIcon
					entitled: 'Accept' ]