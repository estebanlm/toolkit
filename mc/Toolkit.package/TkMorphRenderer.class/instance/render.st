rendering
render
	self magritteDescription isReadonly ifTrue: [ ^ self renderReadonly ].
	self renderEditor