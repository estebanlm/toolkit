accessing
surface
	^ surface ifNil: [ surface := AthensCairoSDLSurface fromSDLSurface: self sdlSurface ]