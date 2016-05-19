accessing
beDraggableRegion: aRectangle
	| version |
	version := SDL_Version new.
	SDL2 getVersion: version.
	
	dragRegion := aRectangle.	
	"Only working for SDL 2.0.4 and above"
	(version major >= 2) & (version minor >= 0) & (version patch >= 4) ifTrue: [
		self setDraggableArea: dragRegion.
		self toggleBorderOff ]