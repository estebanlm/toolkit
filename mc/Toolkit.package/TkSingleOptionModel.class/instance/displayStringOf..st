private
displayStringOf: item
	^ item
		ifNotNil: [ self model magritteDescription reference toString: item ]
		ifNil: [ '' ]	