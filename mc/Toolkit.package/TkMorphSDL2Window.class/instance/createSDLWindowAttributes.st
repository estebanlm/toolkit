initialization
createSDLWindowAttributes
	^ OSWindowAttributes new 
		preferableDriver: OSSDL2Driver current;
		borderless: true;
		resizable: false;
		bounds: (0@0 extent: self rootMorph extent);
		visible: false;
		yourself