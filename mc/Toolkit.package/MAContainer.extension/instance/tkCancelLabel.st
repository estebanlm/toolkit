*Toolkit-Magritte
tkCancelLabel
	^ self propertyAt: #tkCancelLabel ifAbsent: [ self class tkDefaultCancelLabel ]