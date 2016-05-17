private
sdlSurface
	^ sdlSurface ifNil: [ sdlSurface := self sdlHandle getWindowSurface ]