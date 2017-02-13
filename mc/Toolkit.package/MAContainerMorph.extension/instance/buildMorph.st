*Toolkit-Magritte
buildMorph
	| result |
	result := self rectangleMorph.
	self magritteDescription tkFormRenderer 
		model: self on: result.
	^ result