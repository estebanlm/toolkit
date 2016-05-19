testing
isMaximized
	^ (self getFlags bitAnd: SDL_WINDOW_MAXIMIZED) = SDL_WINDOW_MAXIMIZED