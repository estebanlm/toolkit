specs
defaultSpec
	<spec>

	^ SpecLayout composed 
		newRow: [ :row |
			row 
				add: #list;
				add: #addButton width: 22 ] height: self inputTextHeight