private factory
createMenuBox
	"Answer a button for the window menu."
	
	^self theme 
		createMenuBoxFor: self
		scaledTo: self boxExtent