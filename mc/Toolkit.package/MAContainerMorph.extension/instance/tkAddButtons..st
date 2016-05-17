*Toolkit-Magritte-decorating
tkAddButtons: anArray
	morph := self rectangleMorph
		addMorphBack: self morph;
		addMorphBack: (self tkBarMorph: anArray);
		yourself	