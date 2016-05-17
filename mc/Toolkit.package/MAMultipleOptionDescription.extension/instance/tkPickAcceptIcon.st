*Toolkit-Magritte
tkPickAcceptIcon
	^ self propertyAt: #tkPickAcceptIcon ifAbsent: [ self class tkDefaultPickAcceptIcon ]