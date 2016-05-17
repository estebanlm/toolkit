private
descriptionFor: object
	^ listDescription 
		ifNotNil: [ listDescription value: object ]
		ifNil: [ object asString ]