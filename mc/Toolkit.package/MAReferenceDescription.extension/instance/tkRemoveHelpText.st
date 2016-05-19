*Toolkit-Magritte
tkRemoveHelpText
	^ self propertyAt: #tkRemoveHelpText ifAbsent: [ self class tkDefaultRemoveHelpText ]