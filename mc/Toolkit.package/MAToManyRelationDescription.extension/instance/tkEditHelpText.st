*Toolkit-Magritte
tkEditHelpText
	^ self propertyAt: #tkEditHelpText ifAbsent: [ self class tkDefaultEditHelpText ]