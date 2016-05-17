initialization
initializeDragArea
	| version |
	version := SDL_Version new.
	SDL2 getVersion: version.
	
	dragArea := (70@0) extent: ((rootMorph width - 50)@28).	
	"Only working for SDL 2.0.4 and above"
	"(version major >= 2) & (version minor >= 0) & (version patch >= 4) ifTrue: [
		self setDraggableArea: dragArea.
		self toggleBorderOff ]"