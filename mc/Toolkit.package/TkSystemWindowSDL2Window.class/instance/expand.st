actions
expand
	| flags |
	
	flags := self getFlags.
	((flags bitAnd: SDL_WINDOW_MAXIMIZED) = SDL_WINDOW_MAXIMIZED) 
		ifTrue: [ self restore ]
		ifFalse: [ self maximize ]