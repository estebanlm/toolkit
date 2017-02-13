rendering
renderEditor

	self morph
		setBalloonText: self magritteDescription comment;
		listDirection: #topToBottom;
		cellInset: 3
		yourself.

	self model children do: [ :each | | elementMorph |
		elementMorph := self createRectangleMorph
			layoutInset: 1 @ 1;
			listDirection: #leftToRight;
			yourself.
		elementMorph addMorphBack: (self createLabelMorphFor: each magritteDescription).
		self 
			withModel: each 
			do: [ :renderer | each magritteDescription acceptMagritte: renderer ]
			on: elementMorph.
		each magritteDescription hasComment
			ifTrue: [ elementMorph setBalloonText: each comment ].
		self morph addMorphBack: elementMorph ].

	self morph addMorphBack: (self createToolbarMorphFor: self magritteDescription)