*Toolkit-Morphic
createCloseBoxFor: aSystemWindow scaledTo: aPoint
	"Answer a button for closing the window."
	
	^ aSystemWindow createBox
		labelGraphic: (self windowCloseForm scaledToSize: aPoint);
		extent: aSystemWindow boxExtent;
		actionSelector: #closeBoxHit;
		setBalloonText: 'Close this window' translated