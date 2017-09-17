configuring morphs
addToolbar: toolbarMorph size: anInteger to: aMorph
	| frame |
	frame := (0@0 corner: 1@0) asLayoutFrame bottomOffset: anInteger.
	aMorph addMorph: toolbarMorph fullFrame: frame.
	^ Margin left: 0 top: anInteger right: 0 bottom: 0