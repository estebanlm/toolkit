*Toolkit-Magritte
tkAddIcon
	^ self propertyAt: #tkAddIcon ifAbsent: [ self class tkDefaultAddIcon ]