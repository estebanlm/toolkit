*Toolkit-Magritte
tkFormRenderer
	^ self propertyAt: #tkFormRenderer ifAbsent: [ self class tkDefaultFormRenderer ]