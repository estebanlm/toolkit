*Toolkit-Magritte
tkAcceptLabel
	^ self propertyAt: #tkAcceptLabel ifAbsent: [ self class tkDefaultAcceptLabel ]