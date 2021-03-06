"
I represent a special king of morph who can receive arbitrary transmissions (to add transmissions like ""selection"", etc. and allow the browser to have nice transitions).

Example: 

a tkMorph
	title: 'Map';
	morph: [ 
		YourSelectableMapMorph new 
			hResizing: #spaceFill;
			vResizing: #spaceFill;
			yourself ];
	morphTransmissions: [ :presentation  :morph |
		morph  onSelect: [ :aPoint | presentation selection: aPoint ]
"
Class {
	#name : #TkMorphPresentation,
	#superclass : #GLMMorphPresentation,
	#instVars : [
		'morphTransmissions'
	],
	#category : 'Toolkit-Glamour-Presentation'
}

{ #category : #accessing }
TkMorphPresentation >> morphTransmissions [
	^ morphTransmissions ifNil: [ [ :presentation :morph | ] ]
]

{ #category : #accessing }
TkMorphPresentation >> morphTransmissions: aBlock [ 
	morphTransmissions := aBlock
]

{ #category : #rendering }
TkMorphPresentation >> renderGlamorouslyOn: aRenderer [
	self registerAnnouncements.
	^ aRenderer tkRenderMorphPresentation: self
]
