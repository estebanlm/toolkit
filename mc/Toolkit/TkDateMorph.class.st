Class {
	#name : #TkDateMorph,
	#superclass : #MADateMorph,
	#instVars : [
		'textMorph'
	],
	#category : 'Toolkit-Magritte-Morphic'
}

{ #category : #private-building }
TkDateMorph >> buildDateMorphView [
	^ UITheme current 
		newTextEntryIn: nil 
		for: self  
		get: #string  
		set: #string: 
		class: String
		getEnabled: #enabled 
		help: self magritteDescription comment
]

{ #category : #private-building }
TkDateMorph >> buildMorphView [
	^ PanelMorph new
		changeTableLayout;
		listDirection: #leftToRight;
		cellInset: 3;
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		addMorph: self buildPickDateButtonMorph;
		addMorph: (textMorph := self buildDateMorphView);
		yourself
]

{ #category : #private-building }
TkDateMorph >> buildPickDateButtonMorph [
	^ PluggableButtonMorph new 
		icon: self magritteDescription tkPickIcon;
		label: nil;
		helpText: self magritteDescription tkPickHelpText;
		model: self;
		action: #pickDate;
		borderWidth: 0;
		yourself
]

{ #category : #accessing }
TkDateMorph >> enabled [
	^ self magritteDescription readonly not
]

{ #category : #actions }
TkDateMorph >> onDateChosen: aCalendar [
	aCalendar calendar delete.
	self value: aCalendar date.
	self changed: #string
]

{ #category : #actions }
TkDateMorph >> pickDate [
	| calendar |
	calendar := CalendarMorph openOn: self value.
	calendar
		center: calendar cursorPoint;
		fitInWorld;
		onChoiceSend: #onDateChosen: to: self.
]
