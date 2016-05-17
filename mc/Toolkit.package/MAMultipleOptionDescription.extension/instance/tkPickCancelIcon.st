*Toolkit-Magritte
tkPickCancelIcon
	^ self propertyAt: #tkPickCancelIcon ifAbsent: [ self class tkDefaultPickCancelIcon ]