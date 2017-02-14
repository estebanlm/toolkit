initialization
initializeTextMorph: aTextMorph
	self initialize.
	textMorph := aTextMorph.
	self addMorph: textMorph fullFrame: LayoutFrame identity 