Class {
	#name : #TkMiniWindow,
	#superclass : #TkSystemWindow,
	#category : 'Toolkit-Glamour-Morphic'
}

{ #category : #initialization }
TkMiniWindow >> boxExtent [
	^ 6@6
]

{ #category : #'private factory' }
TkMiniWindow >> createCloseBox [
	^self theme 
		createCloseBoxFor: self 
		scaledTo: self boxExtent
]

{ #category : #'private factory' }
TkMiniWindow >> createCollapseBox [
	^ self theme 
		createCollapseBoxFor: self 
		scaledTo: self boxExtent
]

{ #category : #'private factory' }
TkMiniWindow >> createExpandBox [
	"Answer a button for maximising/restoring the window."
	
	^self theme 
		createExpandBoxFor: self
		scaledTo: self boxExtent
]

{ #category : #'private factory' }
TkMiniWindow >> createMenuBox [
	"Answer a button for the window menu."
	
	^self theme 
		createMenuBoxFor: self
		scaledTo: self boxExtent
]

{ #category : #initialization }
TkMiniWindow >> initializeLabelArea [
	"Initialize the label area (titlebar) for the window."
	
	label :=  LabelMorph new
		contents: self labelString;
		font: (LogicalFont 
				familyName: (StandardFonts windowTitleFont familyName) 
				pointSize: self boxExtent y) 
			emphasis: 0.
	label height: self boxExtent y.
	"Add default inital boxes"
	collapseBox := self createCollapseBox.
	closeBox := self createCloseBox.
	self wantsExpandBox ifTrue: [
		expandBox := self createExpandBox.
		self setExpandBoxBalloonText].
	menuBox := self createMenuBox.
	stripes := Array
		with: (Morph newBounds: bounds)
		with: (Morph newBounds: bounds).
	labelArea := (AlignmentMorph newSpacer: Color transparent)
		vResizing: #spaceFill;
		"hResizing: #spaceFill;"
		layoutPolicy: ProportionalLayout new.
	self 
		addMorph: labelArea
		fullFrame: ((0@0 corner: 1@0) asLayoutFrame bottomOffset: 8).
	labelArea goBehind.
	self replaceBoxes.
	labelArea color: Color red
]

{ #category : #private }
TkMiniWindow >> labelHeight [
	^ self boxExtent y + 2
]

{ #category : #initialization }
TkMiniWindow >> setLabelWidgetAllowance [
	"Set the extra space required, in general, apart from the label.
	No extra needed for dialogs."
	
	^labelWidgetAllowance :=  0
]
