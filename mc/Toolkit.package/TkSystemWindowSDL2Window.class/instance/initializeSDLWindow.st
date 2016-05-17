initialization
initializeSDLWindow
	menuList := OrderedCollection new.
	super initializeSDLWindow.
	"self initializeDragArea."
	self prepareSystemWindow.
	