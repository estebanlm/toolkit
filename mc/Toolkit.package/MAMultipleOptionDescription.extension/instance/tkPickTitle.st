*Toolkit-Magritte
tkPickTitle
	^ self propertyAt: #tkPickTitle ifAbsent: [ self class tkDefaultPickTitle ]