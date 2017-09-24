Extension { #name : #UITheme }

{ #category : #'*Toolkit-Morphic' }
UITheme >> createCloseBoxFor: aSystemWindow scaledTo: aPoint [
	"Answer a button for closing the window."
	
	^ aSystemWindow createBox
		labelGraphic: (self windowCloseForm scaledToSize: aPoint);
		extent: aSystemWindow boxExtent;
		actionSelector: #closeBoxHit;
		setBalloonText: 'Close this window' translated
]

{ #category : #'*Toolkit-Morphic' }
UITheme >> createCollapseBoxFor: aSystemWindow scaledTo: aPoint [
	"Answer a button for minimising the window."
	
	^ aSystemWindow createBox
		labelGraphic: (self windowMinimizeForm scaledToSize: aPoint);
		extent: aSystemWindow boxExtent;
		actionSelector: #collapseBoxHit;
		setBalloonText: 'Collapse this window' translated
]

{ #category : #'*Toolkit-Morphic' }
UITheme >> createExpandBoxFor: aSystemWindow scaledTo: aPoint [
	"Answer a button for maximising/restoring the window."
	
	^aSystemWindow createBox
		labelGraphic: (self windowMaximizeForm scaledToSize: aPoint);
		extent: aSystemWindow boxExtent;
		actionSelector: #expandBoxHit;
		setBalloonText: 'Expand to full screen' translated
]

{ #category : #'*Toolkit-Morphic' }
UITheme >> createMenuBoxFor: aSystemWindow scaledTo: aPoint [
	"Answer a button for the window menu."
	
	^aSystemWindow createBox
		labelGraphic: ((self windowMenuIconFor: aSystemWindow) scaledToSize: aPoint);
		extent: aSystemWindow boxExtent;
		actWhen: #buttonDown;
		actionSelector: #offerWindowMenu;
		setBalloonText: 'Window menu' translated
]
