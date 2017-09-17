*Toolkit-Morphic
createCollapseBoxFor: aSystemWindow scaledTo: aPoint
	"Answer a button for minimising the window."
	
	^ aSystemWindow createBox
		labelGraphic: (self windowMinimizeForm scaledToSize: aPoint);
		extent: aSystemWindow boxExtent;
		actionSelector: #collapseBoxHit;
		setBalloonText: 'Collapse this window' translated