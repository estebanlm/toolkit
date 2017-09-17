initialization
initializeLabelArea
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