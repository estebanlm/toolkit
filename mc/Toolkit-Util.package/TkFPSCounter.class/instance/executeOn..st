executing
executeOn: aBlock 
	| start end lastTime |
	start := Time millisecondClockValue.
	aBlock value.
	end := Time millisecondClockValue.
	lastTime := end - start.
	self lastTime: lastTime.
	lastTime = 0
		ifTrue: [ self lastFPS: nil ]
		ifFalse: [ self lastFPS: (1000/lastTime) ceiling ]