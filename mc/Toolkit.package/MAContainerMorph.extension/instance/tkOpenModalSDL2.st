*Toolkit-Magritte-dispatch
tkOpenModalSDL2
	| result window  |

	result := nil.
	window := self morph
		fullBounds;
		asTkSDL2Window.
	window center.
	window show.
	self onAnswer: [ :value | result := value. window close ]. 
	self waitUntilClosed.
	^ result	