configuring morphs
addToolbar: toolbarMorph to: aMorph
	| frame |
	frame := (0@0 corner: 1@0) asLayoutFrame bottomOffset: toolbarMorph height.
	aMorph addMorph: toolbarMorph fullFrame: frame.
	^ Margin left: 0 top: toolbarMorph height right: 0 bottom: 0