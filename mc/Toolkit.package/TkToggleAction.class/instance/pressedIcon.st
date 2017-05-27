accessing
pressedIcon
	^ pressedIcon ifNil: [ pressedIcon := self unpressedIcon darker: 0.5 ]