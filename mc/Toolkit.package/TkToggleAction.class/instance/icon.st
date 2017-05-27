accessing
icon 
	^ icon ifNil: [ 
		self releaseButton. "By default is released"
		icon ]