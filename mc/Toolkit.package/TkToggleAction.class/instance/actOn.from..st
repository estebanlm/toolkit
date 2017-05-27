public interface
actOn: aPresentation from: aButton
	self toggleState.
	aButton 
		label: (AlphaImageMorph new image: self icon);
		changed.
	self actOn: aPresentation