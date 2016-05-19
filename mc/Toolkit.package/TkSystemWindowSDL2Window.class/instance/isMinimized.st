testing
isMinimized
	^ (self getFlags bitAnd: SDL_WINDOW_MINIMIZED) = SDL_WINDOW_MINIMIZED