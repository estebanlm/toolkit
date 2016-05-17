*Toolkit-Magritte
tkRemoveIcon
	^ self propertyAt: #tkRemoveIcon ifAbsent: [ self class tkDefaultRemoveIcon ]