public interface
actOn: aPresentation	 
	^ self action glamourValueWithArgs: 
		{ aPresentation }, 
		aPresentation entity asGlamorousArray, 
		{ self isPressed }