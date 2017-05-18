rendering
morphFrom: aMorphPresentation
	| morph |
	
	morph := super morphFrom: aMorphPresentation.
	aMorphPresentation morphTransmissions 
		cull: aMorphPresentation 
		cull: morph. 
	^ morph 