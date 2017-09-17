*Toolkit-Morphic
createExpandBoxFor: aSystemWindow scaledTo: aPoint
	"Answer a button for maximising/restoring the window."
	
	^aSystemWindow createBox
		labelGraphic: (self windowMaximizeForm scaledToSize: aPoint);
		extent: aSystemWindow boxExtent;
		actionSelector: #expandBoxHit;
		setBalloonText: 'Expand to full screen' translated