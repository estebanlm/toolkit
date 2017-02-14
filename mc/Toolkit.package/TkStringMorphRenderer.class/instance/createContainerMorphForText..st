private factory
createContainerMorphForText: aTextMorph
	"Since twity does not includes any 'frame' for their elements, I need to wrap them into a 
	 morph who does the job."
	^ TkTextFieldContainerMorph textMorph: aTextMorph