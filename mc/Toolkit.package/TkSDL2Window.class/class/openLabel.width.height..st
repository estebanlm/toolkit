instance creation
openLabel: title width: w height: h
	^ self 
		openLabel: title 
		x: SDL_WINDOWPOS_UNDEFINED
		y: SDL_WINDOWPOS_UNDEFINED
		width: w 
		height: h