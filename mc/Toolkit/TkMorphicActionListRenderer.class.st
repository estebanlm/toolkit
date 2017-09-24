"
I render a special kinf od action list defined in TkActionListPresentation.
"
Class {
	#name : #TkMorphicActionListRenderer,
	#superclass : #GLMMorphicActionListRenderer,
	#category : 'Toolkit-Glamour-Morphic'
}

{ #category : #private }
TkMorphicActionListRenderer >> buttonMorph: buttonModel [
	| action |
	action := buttonModel glamourAction.
	^ PluggableButtonMorph new 
			width: action class tkButtonMorphWidth;
			hResizing: #rigid;
			icon: action icon;
			label: action title;
			model: buttonModel;
			action: #execute;
			beIconLeft;
			yourself	
]

{ #category : #accessing-configuration }
TkMorphicActionListRenderer >> defaultSpacerSize [
	^ 5
]

{ #category : #rendering }
TkMorphicActionListRenderer >> morphFrom: anActionListPresentation [ 
	| buttonsContainer buttonModel button |
	
	buttonsContainer := self rectangleMorphFrom: anActionListPresentation.
	
	anActionListPresentation allActions do: [ :each | 
		buttonModel := GLMButtonModel new.
		buttonModel glamourPresentation: anActionListPresentation.
		buttonModel glamourAction: each.

		button := self buttonMorph: buttonModel.
			
		buttonsContainer addMorphBack: button.
		"button width: self class defaultWidth" ].
	
	^ buttonsContainer
]

{ #category : #private }
TkMorphicActionListRenderer >> rectangleMorph [
	^ BorderedMorph new
		borderWidth: 0;
		color: Color transparent;
		layoutPolicy: TableLayout new;
		cellPositioning: #topLeft;
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		yourself	
]

{ #category : #private }
TkMorphicActionListRenderer >> rectangleMorphFrom: anActionListPresentation [
	^ anActionListPresentation isHorizontal 
		ifTrue: [ self rectangleMorphHorizontalFrom: anActionListPresentation ]
		ifFalse: [ self rectangleMorphVerticalFrom: anActionListPresentation ]

]

{ #category : #private }
TkMorphicActionListRenderer >> rectangleMorphHorizontalFrom: anActionListPresentation [
	^ self rectangleMorph
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		listDirection: #leftToRight;
		listCentering: #bottomRight;
		wrapCentering: #bottomRight;
		cellInset: self defaultSpacerSize;
		yourself	
]

{ #category : #private }
TkMorphicActionListRenderer >> rectangleMorphVerticalFrom: anActionListPresentation [
	^ (self rectangleMorphHorizontalFrom: anActionListPresentation)
		listDirection: #topToBottom;
		yourself
		
]
