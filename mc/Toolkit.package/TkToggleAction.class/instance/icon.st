accessing
icon 
	^ icon ifNil: [ 
		self turnOff. "By default is off"
		icon ]