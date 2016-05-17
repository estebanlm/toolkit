private
sdlHandle
	^ sdlHandle ifNil: [ sdlHandle := self validHandle handle ]