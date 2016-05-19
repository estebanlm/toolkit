open/close
tkOpen
	super tkOpen.
	self announce: (WindowOpened new window: self)	