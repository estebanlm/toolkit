*Toolkit-Magritte
tkRowsToShow
	^ self propertyAt: #tkRowsToShow ifAbsent: [ self class tkDefaultRowsToShow ]