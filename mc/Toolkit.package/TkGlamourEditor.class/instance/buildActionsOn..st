building
buildActionsOn: aBrowser

	aBrowser transmit 
		to: #actions;
		andShow: [ :a | 
			a tkActionList
				act: [ window close ] 
					icon: self cancelIcon
					entitled: 'Cancel';
				act: [ self inform: 'Please select one element first!' ] 
					icon: self acceptIcon 
					entitled: 'Accept' ].

	aBrowser transmit 
		from: #objects;
		to: #actions;
		andShow: [ :a | 
			a tkActionList
				act: [ window close ] 
					icon: self cancelIcon
					entitled: 'Cancel';
				act: [ :presenter :selection | value := selection. window close ] 
					icon: self acceptIcon
					entitled: 'Accept' ]