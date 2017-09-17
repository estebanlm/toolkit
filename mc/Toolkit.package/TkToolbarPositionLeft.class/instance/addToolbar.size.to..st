configuring morphs
addToolbar: toolbarMorph size: anInteger to: aMorph
	| frame |
	frame := (0 @ 0 corner: 0 @ 1) asLayoutFrame rightOffset: anInteger + 8.
	aMorph addMorph: toolbarMorph fullFrame: frame.
	^ Margin left: anInteger + 8 top: 0 right: 0 bottom: 0