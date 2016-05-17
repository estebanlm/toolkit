*Toolkit-Magritte
tkAddHelpText
	^ self propertyAt: #tkAddHelpText ifAbsent: [ self class tkDefaultAddHelpText ]