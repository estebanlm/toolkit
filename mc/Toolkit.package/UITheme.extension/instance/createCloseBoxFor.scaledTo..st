*Toolkit-Morphic
createCloseBoxFor: aSystemWindow scaledTo: aPoint
	"Answer a button for closing the window."
	
	^(self
		newCloseControlIn: aSystemWindow
		for: aSystemWindow
		action: [aSystemWindow closeBoxHit]
		help: 'Close this window' translated
		scaledTo: aPoint)
		extent: aSystemWindow boxExtent