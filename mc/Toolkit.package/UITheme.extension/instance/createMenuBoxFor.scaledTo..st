*Toolkit-Morphic
createMenuBoxFor: aSystemWindow scaledTo: aPoint
	"Answer a button for the window menu."
	
	^aSystemWindow createBox
		labelGraphic: ((self windowMenuIconFor: aSystemWindow) scaledToSize: aPoint);
		extent: aSystemWindow boxExtent;
		actWhen: #buttonDown;
		actionSelector: #offerWindowMenu;
		setBalloonText: 'Window menu' translated