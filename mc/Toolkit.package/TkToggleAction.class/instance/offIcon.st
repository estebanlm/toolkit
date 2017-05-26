accessing
offIcon
	^ offIcon ifNil: [ offIcon := self onIcon darker: 0.5 ]